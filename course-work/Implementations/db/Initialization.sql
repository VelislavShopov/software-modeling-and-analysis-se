CREATE DATABASE WinbetDB;
GO

USE WinbetDB;
GO

CREATE TABLE [User] (
    user_id INT IDENTITY(1,1) PRIMARY KEY,
    username VARCHAR(50) NOT NULL UNIQUE,
    email VARCHAR(100) NOT NULL UNIQUE,
    password_hash VARCHAR(255) NOT NULL,
    egn VARCHAR(10) NOT NULL UNIQUE,
    is_verified BIT NOT NULL DEFAULT 0,
    created_at DATETIME NOT NULL DEFAULT GETDATE()
);

CREATE TABLE Wallet (
    wallet_id INT IDENTITY(1,1) PRIMARY KEY,
    user_id INT NOT NULL UNIQUE,
    balance DECIMAL(10,2) NOT NULL DEFAULT 0.00 CHECK (balance >= 0),
    bonus_balance DECIMAL(10,2) NOT NULL DEFAULT 0.00 CHECK (bonus_balance >= 0),
    daily_deposit_limit DECIMAL(10,2) NOT NULL DEFAULT 5000.00,
    CONSTRAINT FK_Wallet_User FOREIGN KEY (user_id) REFERENCES [User](user_id)
);

CREATE TABLE [Transaction] (
    transaction_id INT IDENTITY(1,1) PRIMARY KEY,
    wallet_id INT NOT NULL,
    [type] VARCHAR(20) NOT NULL CHECK ([type] IN ('Deposit', 'Withdrawal', 'Bet', 'Win')),
    amount DECIMAL(10,2) NOT NULL CHECK (amount > 0),
    [status] VARCHAR(20) NOT NULL CHECK ([status] IN ('Pending', 'Completed', 'Rejected')),
    created_at DATETIME NOT NULL DEFAULT GETDATE(),
    CONSTRAINT FK_Transaction_Wallet FOREIGN KEY (wallet_id) REFERENCES Wallet(wallet_id)
);

CREATE TABLE SportEvent (
    event_id INT IDENTITY(1,1) PRIMARY KEY,
    sport_name VARCHAR(50) NOT NULL,
    league_name VARCHAR(100) NOT NULL,
    home_team VARCHAR(100) NOT NULL,
    away_team VARCHAR(100) NOT NULL,
    start_time DATETIME NOT NULL,
    [status] VARCHAR(20) NOT NULL CHECK ([status] IN ('Scheduled', 'Live', 'Finished', 'Cancelled')),
    result VARCHAR(20) NULL
);

CREATE TABLE Market (
    market_id INT IDENTITY(1,1) PRIMARY KEY,
    event_id INT NOT NULL,
    market_type VARCHAR(50) NOT NULL,
    selection_name VARCHAR(50) NOT NULL,
    current_odd DECIMAL(5,2) NOT NULL CHECK (current_odd >= 1.01),
    is_active BIT NOT NULL DEFAULT 1,
    CONSTRAINT FK_Market_SportEvent FOREIGN KEY (event_id) REFERENCES SportEvent(event_id)
);

CREATE TABLE BetSlip (
    betslip_id INT IDENTITY(1,1) PRIMARY KEY,
    user_id INT NOT NULL,
    stake DECIMAL(10,2) NOT NULL CHECK (stake >= 0.50),
    total_odd DECIMAL(8,2) NOT NULL CHECK (total_odd >= 1.01),
    potential_win DECIMAL(10,2) NOT NULL,
    [status] VARCHAR(20) NOT NULL CHECK ([status] IN ('Open', 'Won', 'Lost', 'CashedOut')),
    placed_at DATETIME NOT NULL DEFAULT GETDATE(),
    CONSTRAINT FK_BetSlip_User FOREIGN KEY (user_id) REFERENCES [User](user_id)
);

CREATE TABLE BetSelection (
    selection_id INT IDENTITY(1,1) PRIMARY KEY,
    betslip_id INT NOT NULL,
    market_id INT NOT NULL,
    locked_odd DECIMAL(5,2) NOT NULL,
    result_status VARCHAR(20) NOT NULL DEFAULT 'Pending' CHECK (result_status IN ('Pending', 'Won', 'Lost', 'Void')),
    CONSTRAINT FK_BetSelection_BetSlip FOREIGN KEY (betslip_id) REFERENCES BetSlip(betslip_id),
    CONSTRAINT FK_BetSelection_Market FOREIGN KEY (market_id) REFERENCES Market(market_id)
);

CREATE TABLE UserBonus (
    bonus_id INT IDENTITY(1,1) PRIMARY KEY,
    user_id INT NOT NULL,
    promo_name VARCHAR(100) NOT NULL,
    wagering_required DECIMAL(10,2) NOT NULL,
    expires_at DATETIME NOT NULL,
    CONSTRAINT FK_UserBonus_User FOREIGN KEY (user_id) REFERENCES [User](user_id)
);
GO