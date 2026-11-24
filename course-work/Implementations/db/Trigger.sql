USE WinbetDB;
GO

CREATE TRIGGER dbo.trg_CreateWalletOnUserInsert
ON [User]
AFTER INSERT
AS
BEGIN
    SET NOCOUNT ON;

    INSERT INTO Wallet (user_id, balance, bonus_balance, daily_deposit_limit)
    SELECT i.user_id, 0.00, 0.00, 5000.00
    FROM inserted i;
END;
GO