USE WinbetDB;
GO

CREATE PROCEDURE dbo.sp_PlaceBet
    @UserId INT,
    @Stake DECIMAL(10,2),
    @MarketId INT
AS
BEGIN
    SET NOCOUNT ON;
    BEGIN TRY
        BEGIN TRANSACTION;

        DECLARE @IsVerified BIT;
        DECLARE @WalletId INT;
        DECLARE @Balance DECIMAL(10,2);

        SELECT @IsVerified = u.is_verified,
               @WalletId = w.wallet_id,
               @Balance = w.balance
        FROM [User] u
        INNER JOIN Wallet w ON u.user_id = w.user_id
        WHERE u.user_id = @UserId;

        IF @IsVerified IS NULL
            THROW 50001, 'User does not exist.', 1;

        IF @IsVerified = 0
            THROW 50002, 'Account is not verified (KYC). Betting is disabled.', 1;

        IF @Balance < @Stake
            THROW 50003, 'Insufficient wallet balance.', 1;

        DECLARE @CurrentOdd DECIMAL(5,2);
        DECLARE @IsActive BIT;

        SELECT @CurrentOdd = current_odd,
               @IsActive = is_active
        FROM Market
        WHERE market_id = @MarketId;

        IF @CurrentOdd IS NULL OR @IsActive = 0
            THROW 50004, 'Selected market is inactive or does not exist.', 1;

        DECLARE @PotentialWin DECIMAL(10,2) = dbo.fn_CalculatePotentialWin(@Stake, @CurrentOdd);

        UPDATE Wallet
        SET balance = balance - @Stake
        WHERE wallet_id = @WalletId;

        INSERT INTO BetSlip (user_id, stake, total_odd, potential_win, [status])
        VALUES (@UserId, @Stake, @CurrentOdd, @PotentialWin, 'Open');

        DECLARE @NewBetSlipId INT = SCOPE_IDENTITY();

        INSERT INTO BetSelection (betslip_id, market_id, locked_odd, result_status)
        VALUES (@NewBetSlipId, @MarketId, @CurrentOdd, 'Pending');

        INSERT INTO [Transaction] (wallet_id, [type], amount, [status])
        VALUES (@WalletId, 'Bet', @Stake, 'Completed');

        COMMIT TRANSACTION;
        PRINT 'Bet slip #' + CAST(@NewBetSlipId AS VARCHAR(20)) + ' placed successfully!';
    END TRY
    BEGIN CATCH
        IF @@TRANCOUNT > 0
            ROLLBACK TRANSACTION;
        THROW;
    END CATCH
END;
GO