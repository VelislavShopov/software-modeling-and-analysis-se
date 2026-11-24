USE WinbetDB;
GO

INSERT INTO [User] (username, email, password_hash, egn, is_verified) VALUES
('ivan_petrov', 'ivan.petrov@abv.bg', 'hash_9f86d081884c7d659a2feaa0c55ad015', '9504124560', 1),
('elena_georgieva', 'elena.g@gmail.com', 'hash_5e884898da28047151d0e56f8dc62927', '9811237891', 1),
('georgi_dimitrov', 'g.dimitrov@yahoo.com', 'hash_6cf615d5bcaac778352a8f1f3360d23f', '0102153428', 1),
('nikolay_stoyanov', 'niki_st@mail.bg', 'hash_2c26b46b68ffc68ff99b453c1d304134', '9208091122', 0);

UPDATE Wallet SET balance = 250.00, bonus_balance = 50.00, daily_deposit_limit = 2000.00 WHERE user_id = 1;
UPDATE Wallet SET balance = 120.00, bonus_balance = 0.00, daily_deposit_limit = 1000.00 WHERE user_id = 2;
UPDATE Wallet SET balance = 500.00, bonus_balance = 100.00, daily_deposit_limit = 5000.00 WHERE user_id = 3;
UPDATE Wallet SET balance = 50.00, bonus_balance = 0.00, daily_deposit_limit = 500.00 WHERE user_id = 4;

INSERT INTO [Transaction] (wallet_id, [type], amount, [status]) VALUES
(1, 'Deposit', 250.00, 'Completed'),
(2, 'Deposit', 120.00, 'Completed'),
(3, 'Deposit', 500.00, 'Completed'),
(4, 'Deposit', 50.00, 'Completed');

INSERT INTO UserBonus (user_id, promo_name, wagering_required, expires_at) VALUES
(1, 'Welcome Sports Bonus 100%', 300.00, DATEADD(DAY, 30, GETDATE())),
(3, 'Weekend VIP Cashback', 500.00, DATEADD(DAY, 14, GETDATE()));

INSERT INTO SportEvent (sport_name, league_name, home_team, away_team, start_time, [status], result) VALUES
('Football', 'efbet Liga', 'Levski Sofia', 'CSKA Sofia', DATEADD(HOUR, 3, GETDATE()), 'Scheduled', NULL),
('Football', 'Champions League', 'Real Madrid', 'Bayern Munich', DATEADD(HOUR, 5, GETDATE()), 'Scheduled', NULL),
('Tennis', 'ATP Tour', 'Grigor Dimitrov', 'Jannik Sinner', DATEADD(MINUTE, -40, GETDATE()), 'Live', NULL),
('Basketball', 'EuroLeague', 'Olympiacos', 'Panathinaikos', DATEADD(DAY, -1, GETDATE()), 'Finished', 'Home Won');

INSERT INTO Market (event_id, market_type, selection_name, current_odd, is_active) VALUES
(1, '1X2', '1 (Levski)', 2.40, 1),
(1, '1X2', 'X (Draw)', 3.10, 1),
(1, '1X2', '2 (CSKA)', 2.85, 1),
(2, 'Over/Under 2.5', 'Over 2.5', 1.75, 1),
(2, '1X2', '1 (Real Madrid)', 1.95, 1),
(3, 'Match Winner', 'G. Dimitrov', 2.10, 1),
(4, 'Match Winner', 'Olympiacos', 1.65, 0);

EXEC dbo.sp_PlaceBet @UserId = 1, @Stake = 20.00, @MarketId = 1;
EXEC dbo.sp_PlaceBet @UserId = 2, @Stake = 50.00, @MarketId = 6;
GO