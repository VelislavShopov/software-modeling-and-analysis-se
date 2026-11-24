USE WinbetDB;
GO

CREATE FUNCTION dbo.fn_CalculatePotentialWin (
    @Stake DECIMAL(10,2),
    @TotalOdd DECIMAL(8,2)
)
RETURNS DECIMAL(10,2)
AS
BEGIN
    RETURN ROUND(@Stake * @TotalOdd, 2);
END;
GO