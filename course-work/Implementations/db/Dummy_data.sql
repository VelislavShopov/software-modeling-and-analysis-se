USE WinbetDB;
GO

DELETE FROM BetSelection;
DELETE FROM BetSlip;
DELETE FROM [Transaction];
DELETE FROM UserBonus;
DELETE FROM Market;
DELETE FROM SportEvent;
DELETE FROM Wallet;
DELETE FROM [User];

DBCC CHECKIDENT ('BetSelection', RESEED, 0);
DBCC CHECKIDENT ('BetSlip', RESEED, 0);
DBCC CHECKIDENT ('[Transaction]', RESEED, 0);
DBCC CHECKIDENT ('UserBonus', RESEED, 0);
DBCC CHECKIDENT ('Market', RESEED, 0);
DBCC CHECKIDENT ('SportEvent', RESEED, 0);
DBCC CHECKIDENT ('Wallet', RESEED, 0);
DBCC CHECKIDENT ('[User]', RESEED, 0);
GO

INSERT INTO [User] (username, email, password_hash, egn, is_verified, created_at) VALUES
('ivan_petrov',       'ivan.petrov@abv.bg',       'hash_001', '9504124560', 1, DATEADD(DAY, -30, GETDATE())),
('elena_georgieva',   'elena.g@gmail.com',        'hash_002', '9811237891', 1, DATEADD(DAY, -28, GETDATE())),
('georgi_dimitrov',   'g.dimitrov@yahoo.com',     'hash_003', '0102153428', 1, DATEADD(DAY, -26, GETDATE())),
('nikolay_stoyanov',  'niki_st@mail.bg',          'hash_004', '9208091122', 0, DATEADD(DAY, -25, GETDATE())),
('maria_ivanova',     'maria.iv@gmail.com',       'hash_005', '9905176631', 1, DATEADD(DAY, -23, GETDATE())),
('dimitar_kolev',     'd.kolev@abv.bg',           'hash_006', '9401038842', 1, DATEADD(DAY, -22, GETDATE())),
('petar_nikolov',     'p.nikolov@outlook.com',    'hash_007', '9707285519', 1, DATEADD(DAY, -20, GETDATE())),
('simona_hristova',   'simona.h@gmail.com',       'hash_008', '0012049920', 1, DATEADD(DAY, -19, GETDATE())),
('viktor_todorov',    'v.todorov@yahoo.com',      'hash_009', '9103194473', 0, DATEADD(DAY, -17, GETDATE())),
('kristina_popova',   'k.popova@abv.bg',          'hash_010', '9609112384', 1, DATEADD(DAY, -16, GETDATE())),
('aleks_vasilev',     'a.vasilev@gmail.com',      'hash_011', '0206257715', 1, DATEADD(DAY, -14, GETDATE())),
('teodora_marinova',  't.marinova@mail.bg',       'hash_012', '9310306198', 1, DATEADD(DAY, -13, GETDATE())),
('martin_angelov',    'm.angelov@gmail.com',      'hash_013', '9512013341', 1, DATEADD(DAY, -11, GETDATE())),
('gabriela_illeva',   'g.ilieva@abv.bg',          'hash_014', '9908147729', 1, DATEADD(DAY, -10, GETDATE())),
('stefan_bobeva',     's.bobeva@outlook.com',     'hash_015', '9004225581', 1, DATEADD(DAY,  -9, GETDATE())),
('denitsa_kaneva',    'd.kaneva@gmail.com',       'hash_016', '0111096642', 0, DATEADD(DAY,  -8, GETDATE())),
('boris_atanasov',    'b.atanasov@abv.bg',        'hash_017', '9602181190', 1, DATEADD(DAY,  -6, GETDATE())),
('radostina_peneva',  'r.peneva@yahoo.com',       'hash_018', '9806278834', 1, DATEADD(DAY,  -5, GETDATE())),
('hristo_zahariev',   'h.zahariev@gmail.com',     'hash_019', '9409152276', 1, DATEADD(DAY,  -3, GETDATE())),
('plamena_nikolova',  'p.nikolova88@mail.bg',     'hash_020', '9703075503', 1, DATEADD(DAY,  -2, GETDATE()));

UPDATE Wallet SET balance =  420.00, bonus_balance =  50.00, daily_deposit_limit = 2500.00 WHERE user_id = 1;
UPDATE Wallet SET balance =  310.00, bonus_balance =  25.00, daily_deposit_limit = 1500.00 WHERE user_id = 2;
UPDATE Wallet SET balance =  950.00, bonus_balance = 100.00, daily_deposit_limit = 5000.00 WHERE user_id = 3;
UPDATE Wallet SET balance =   80.00, bonus_balance =   0.00, daily_deposit_limit =  500.00 WHERE user_id = 4;
UPDATE Wallet SET balance =  540.00, bonus_balance =  40.00, daily_deposit_limit = 2500.00 WHERE user_id = 5;
UPDATE Wallet SET balance =  380.00, bonus_balance =   0.00, daily_deposit_limit = 2000.00 WHERE user_id = 6;
UPDATE Wallet SET balance =  260.00, bonus_balance =  20.00, daily_deposit_limit = 1500.00 WHERE user_id = 7;
UPDATE Wallet SET balance =  690.00, bonus_balance =  75.00, daily_deposit_limit = 3000.00 WHERE user_id = 8;
UPDATE Wallet SET balance =  110.00, bonus_balance =   0.00, daily_deposit_limit =  500.00 WHERE user_id = 9;
UPDATE Wallet SET balance =  830.00, bonus_balance =  60.00, daily_deposit_limit = 4000.00 WHERE user_id = 10;
UPDATE Wallet SET balance =  340.00, bonus_balance =  15.00, daily_deposit_limit = 1500.00 WHERE user_id = 11;
UPDATE Wallet SET balance =  490.00, bonus_balance =  30.00, daily_deposit_limit = 2000.00 WHERE user_id = 12;
UPDATE Wallet SET balance =  610.00, bonus_balance =  50.00, daily_deposit_limit = 3000.00 WHERE user_id = 13;
UPDATE Wallet SET balance =  275.00, bonus_balance =  25.00, daily_deposit_limit = 1500.00 WHERE user_id = 14;
UPDATE Wallet SET balance =  460.00, bonus_balance =   0.00, daily_deposit_limit = 2500.00 WHERE user_id = 15;
UPDATE Wallet SET balance =   95.00, bonus_balance =   0.00, daily_deposit_limit =  500.00 WHERE user_id = 16;
UPDATE Wallet SET balance =  720.00, bonus_balance =  80.00, daily_deposit_limit = 3500.00 WHERE user_id = 17;
UPDATE Wallet SET balance =  330.00, bonus_balance =  20.00, daily_deposit_limit = 2000.00 WHERE user_id = 18;
UPDATE Wallet SET balance =  580.00, bonus_balance =  45.00, daily_deposit_limit = 3000.00 WHERE user_id = 19;
UPDATE Wallet SET balance =  405.00, bonus_balance =  35.00, daily_deposit_limit = 2000.00 WHERE user_id = 20;

INSERT INTO [Transaction] (wallet_id, [type], amount, [status], created_at) VALUES
(1,  'Deposit',    250.00, 'Completed', DATEADD(DAY, -20, GETDATE())),
(1,  'Deposit',    220.00, 'Completed', DATEADD(DAY,  -8, GETDATE())),
(2,  'Deposit',    350.00, 'Completed', DATEADD(DAY, -18, GETDATE())),
(3,  'Deposit',    800.00, 'Completed', DATEADD(DAY, -16, GETDATE())),
(3,  'Withdrawal', 150.00, 'Completed', DATEADD(DAY,  -5, GETDATE())),
(4,  'Deposit',     80.00, 'Completed', DATEADD(DAY, -15, GETDATE())),
(5,  'Deposit',    600.00, 'Completed', DATEADD(DAY, -14, GETDATE())),
(6,  'Deposit',    420.00, 'Completed', DATEADD(DAY, -13, GETDATE())),
(7,  'Deposit',    300.00, 'Completed', DATEADD(DAY, -12, GETDATE())),
(8,  'Deposit',    750.00, 'Completed', DATEADD(DAY, -11, GETDATE())),
(8,  'Withdrawal', 120.00, 'Completed', DATEADD(DAY,  -4, GETDATE())),
(9,  'Deposit',    110.00, 'Completed', DATEADD(DAY, -10, GETDATE())),
(10, 'Deposit',    900.00, 'Completed', DATEADD(DAY,  -9, GETDATE())),
(10, 'Withdrawal', 200.00, 'Completed', DATEADD(DAY,  -2, GETDATE())),
(11, 'Deposit',    380.00, 'Completed', DATEADD(DAY,  -8, GETDATE())),
(12, 'Deposit',    520.00, 'Completed', DATEADD(DAY,  -7, GETDATE())),
(13, 'Deposit',    650.00, 'Completed', DATEADD(DAY,  -6, GETDATE())),
(14, 'Deposit',    310.00, 'Completed', DATEADD(DAY,  -6, GETDATE())),
(15, 'Deposit',    500.00, 'Completed', DATEADD(DAY,  -5, GETDATE())),
(16, 'Deposit',     95.00, 'Completed', DATEADD(DAY,  -5, GETDATE())),
(17, 'Deposit',    800.00, 'Completed', DATEADD(DAY,  -4, GETDATE())),
(18, 'Deposit',    360.00, 'Completed', DATEADD(DAY,  -3, GETDATE())),
(19, 'Deposit',    620.00, 'Completed', DATEADD(DAY,  -2, GETDATE())),
(20, 'Deposit',    440.00, 'Completed', DATEADD(DAY,  -1, GETDATE()));

INSERT INTO UserBonus (user_id, promo_name, wagering_required, expires_at) VALUES
(1,  'Welcome Sports Bonus 100%', 300.00, DATEADD(DAY, 20, GETDATE())),
(2,  'Free Bet Friday',            100.00, DATEADD(DAY, 10, GETDATE())),
(3,  'Weekend VIP Cashback',      500.00, DATEADD(DAY, 14, GETDATE())),
(5,  'Reload Bonus 50%',          250.00, DATEADD(DAY, 15, GETDATE())),
(7,  'Tennis Masters Boost',        120.00, DATEADD(DAY,  7, GETDATE())),
(8,  'Welcome Sports Bonus 100%', 300.00, DATEADD(DAY, 25, GETDATE())),
(10, 'High Roller Reload',          600.00, DATEADD(DAY, 18, GETDATE())),
(12, 'Accumulator Insurance',       150.00, DATEADD(DAY, 12, GETDATE())),
(13, 'Champions League Boost',      200.00, DATEADD(DAY,  9, GETDATE())),
(14, 'Welcome Sports Bonus 100%', 300.00, DATEADD(DAY, 22, GETDATE())),
(17, 'VIP Cashback 15%',          450.00, DATEADD(DAY, 16, GETDATE())),
(18, 'Free Bet Weekend',            120.00, DATEADD(DAY,  6, GETDATE())),
(19, 'Reload Bonus 50%',          250.00, DATEADD(DAY, 11, GETDATE())),
(20, 'Esports Clash Bonus',         180.00, DATEADD(DAY, 13, GETDATE()));

INSERT INTO SportEvent (sport_name, league_name, home_team, away_team, start_time, [status], result) VALUES
('Football',   'efbet Liga',       'Levski Sofia',        'CSKA Sofia',          DATEADD(DAY, -10, GETDATE()),  'Finished',  'Home Won'),
('Football',   'Champions League', 'Real Madrid',         'Bayern Munich',       DATEADD(DAY,  -9, GETDATE()),  'Finished',  'Draw'),
('Tennis',     'ATP Tour',         'Grigor Dimitrov',     'Jannik Sinner',       DATEADD(DAY,  -8, GETDATE()),  'Finished',  'Home Won'),
('Basketball', 'EuroLeague',       'Olympiacos',          'Panathinaikos',       DATEADD(DAY,  -7, GETDATE()),  'Finished',  'Home Won'),
('Football',   'Premier League',   'Arsenal',             'Liverpool',           DATEADD(DAY,  -6, GETDATE()),  'Finished',  'Away Won'),
('Esports',    'BLAST Premier',    'NAVI',                'FaZe Clan',           DATEADD(DAY,  -5, GETDATE()),  'Finished',  'Home Won'),
('Volleyball', 'CEV Champions',    'Lube Civitanova',     'Trentino Volley',     DATEADD(DAY,  -4, GETDATE()),  'Finished',  'Away Won'),
('Football',   'Serie A',          'Inter Milan',         'AC Milan',            DATEADD(DAY,  -3, GETDATE()),  'Finished',  'Home Won'),
('Basketball', 'NBA',              'Boston Celtics',      'Denver Nuggets',      DATEADD(DAY,  -2, GETDATE()),  'Finished',  'Home Won'),
('Tennis',     'WTA Tour',         'Iga Swiatek',         'Aryna Sabalenka',     DATEADD(DAY,  -1, GETDATE()),  'Finished',  'Away Won'),
('Volleyball', 'SuperLega',        'Sir Safety Perugia',  'Vero Volley Monza',   DATEADD(HOUR, -2, GETDATE()),  'Live',      NULL),
('Esports',    'ESL Pro League',   'G2 Esports',          'Team Vitality',       DATEADD(HOUR, -1, GETDATE()),  'Live',      NULL),
('Football',   'La Liga',          'Barcelona',           'Atletico Madrid',     DATEADD(HOUR,  4, GETDATE()),  'Scheduled', NULL),
('Football',   'Bundesliga',       'Borussia Dortmund',   'RB Leipzig',          DATEADD(HOUR,  7, GETDATE()),  'Scheduled', NULL),
('Basketball', 'NBA',              'LA Lakers',           'Golden State',        DATEADD(DAY,   1, GETDATE()),  'Scheduled', NULL),
('Tennis',     'ATP Finals',       'Carlos Alcaraz',      'Alexander Zverev',    DATEADD(DAY,   2, GETDATE()),  'Scheduled', NULL);

INSERT INTO Market (event_id, market_type, selection_name, current_odd, is_active) VALUES
(1,  '1X2',            '1 (Levski Sofia)',      2.30, 0),
(1,  'Over/Under 2.5', 'Over 2.5',              1.85, 0),
(2,  '1X2',            'X (Draw)',              3.40, 0),
(2,  '1X2',            '2 (Bayern Munich)',     2.45, 0),
(3,  'Match Winner',   'Grigor Dimitrov',       2.15, 0),
(3,  'Match Winner',   'Jannik Sinner',         1.70, 0),
(4,  'Match Winner',   'Olympiacos',            1.65, 0),
(4,  'Total Points',   'Over 158.5',            1.90, 0),
(5,  '1X2',            '2 (Liverpool)',         2.60, 0),
(5,  '1X2',            '1 (Arsenal)',           2.50, 0),
(6,  'Match Winner',   'NAVI',                  1.75, 0),
(6,  'Map Handicap',   'NAVI -1.5',             2.95, 0),
(7,  'Match Winner',   'Trentino Volley',       2.05, 0),
(7,  'Match Winner',   'Lube Civitanova',       1.78, 0),
(8,  '1X2',            '1 (Inter Milan)',       1.92, 0),
(8,  'Over/Under 2.5', 'Under 2.5',             1.82, 0),
(9,  'Match Winner',   'Boston Celtics',        1.62, 0),
(9,  'Match Winner',   'Denver Nuggets',        2.28, 0),
(10, 'Match Winner',   'Aryna Sabalenka',       1.88, 0),
(10, 'Match Winner',   'Iga Swiatek',           1.94, 0),
(11, 'Match Winner',   'Sir Safety Perugia',    1.55, 1),
(11, 'Match Winner',   'Vero Volley Monza',     2.40, 1),
(12, 'Match Winner',   'G2 Esports',            1.90, 1),
(12, 'Match Winner',   'Team Vitality',         1.86, 1),
(13, '1X2',            '1 (Barcelona)',         1.95, 1),
(13, 'Over/Under 2.5', 'Over 2.5',              1.78, 1),
(14, '1X2',            '1 (Borussia Dortmund)', 2.15, 1),
(14, '1X2',            'X (Draw)',              3.35, 1),
(15, 'Match Winner',   'LA Lakers',             2.02, 1),
(15, 'Match Winner',   'Golden State',          1.80, 1),
(16, 'Match Winner',   'Carlos Alcaraz',        1.72, 1),
(16, 'Match Winner',   'Alexander Zverev',      2.12, 1);

EXEC dbo.sp_PlaceBet @UserId = 1,  @Stake =  30.00, @MarketId = 1;
EXEC dbo.sp_PlaceBet @UserId = 1,  @Stake =  45.00, @MarketId = 25;
EXEC dbo.sp_PlaceBet @UserId = 2,  @Stake =  25.00, @MarketId = 3;
EXEC dbo.sp_PlaceBet @UserId = 2,  @Stake =  50.00, @MarketId = 17;
EXEC dbo.sp_PlaceBet @UserId = 3,  @Stake =  90.00, @MarketId = 5;
EXEC dbo.sp_PlaceBet @UserId = 3,  @Stake = 120.00, @MarketId = 11;
EXEC dbo.sp_PlaceBet @UserId = 5,  @Stake =  40.00, @MarketId = 7;
EXEC dbo.sp_PlaceBet @UserId = 5,  @Stake =  55.00, @MarketId = 26;
EXEC dbo.sp_PlaceBet @UserId = 6,  @Stake =  60.00, @MarketId = 9;
EXEC dbo.sp_PlaceBet @UserId = 7,  @Stake =  35.00, @MarketId = 13;
EXEC dbo.sp_PlaceBet @UserId = 8,  @Stake =  85.00, @MarketId = 15;
EXEC dbo.sp_PlaceBet @UserId = 8,  @Stake =  45.00, @MarketId = 21;
EXEC dbo.sp_PlaceBet @UserId = 10, @Stake = 110.00, @MarketId = 19;
EXEC dbo.sp_PlaceBet @UserId = 10, @Stake =  75.00, @MarketId = 27;
EXEC dbo.sp_PlaceBet @UserId = 11, @Stake =  40.00, @MarketId = 23;
EXEC dbo.sp_PlaceBet @UserId = 12, @Stake =  65.00, @MarketId = 1;
EXEC dbo.sp_PlaceBet @UserId = 13, @Stake =  80.00, @MarketId = 9;
EXEC dbo.sp_PlaceBet @UserId = 14, @Stake =  35.00, @MarketId = 13;
EXEC dbo.sp_PlaceBet @UserId = 15, @Stake =  70.00, @MarketId = 15;
EXEC dbo.sp_PlaceBet @UserId = 17, @Stake =  95.00, @MarketId = 19;
EXEC dbo.sp_PlaceBet @UserId = 18, @Stake =  45.00, @MarketId = 29;
EXEC dbo.sp_PlaceBet @UserId = 19, @Stake =  60.00, @MarketId = 31;
EXEC dbo.sp_PlaceBet @UserId = 20, @Stake =  50.00, @MarketId = 22;
EXEC dbo.sp_PlaceBet @UserId = 12, @Stake =  30.00, @MarketId = 28;

UPDATE BetSelection SET result_status = 'Won'  WHERE market_id IN (1, 3, 5, 7, 9, 11, 13, 15, 17, 19);
UPDATE BetSelection SET result_status = 'Lost' WHERE market_id IN (2, 4, 6, 8, 10, 12, 14, 16, 18, 20);

UPDATE BetSlip
SET [status] = CASE
    WHEN EXISTS (SELECT 1 FROM BetSelection bs WHERE bs.betslip_id = BetSlip.betslip_id AND bs.result_status = 'Lost') THEN 'Lost'
    WHEN NOT EXISTS (SELECT 1 FROM BetSelection bs WHERE bs.betslip_id = BetSlip.betslip_id AND bs.result_status <> 'Won') THEN 'Won'
    ELSE 'Open'
END;

INSERT INTO [Transaction] (wallet_id, [type], amount, [status], created_at)
SELECT w.wallet_id, 'Win', b.potential_win, 'Completed', DATEADD(DAY, -1, GETDATE())
FROM BetSlip b
INNER JOIN Wallet w ON b.user_id = w.user_id
WHERE b.[status] = 'Won';

UPDATE w
SET w.balance = w.balance + b.potential_win
FROM Wallet w
INNER JOIN BetSlip b ON w.user_id = b.user_id
WHERE b.[status] = 'Won';
GO