-- Select the database
USE personal_expence;

-- =========================
-- CREATE USER TABLE
-- =========================
CREATE TABLE user5 (
    user_id INT,                -- Unique ID for each user
    name VARCHAR(100),          -- User's name
    email VARCHAR(150),         -- User's email
    password VARCHAR(100),      -- User's password
    created_at DATE             -- Account creation date
);

-- Insert sample data into user table
INSERT INTO user5 (
    user_id, name, email, password, created_at
)
VALUES
(1, 'Hadeen', 'hadeen@gmail.com', 'pass1234', '2026-02-25'),
(2, 'Ali', 'ali@gmail.com', 'ali@2026', '2026-02-24'),
(3, 'Sara', 'sara@gmail.com', 'sara', '2026-02-23');


-- =========================
-- CREATE INCOME TABLE
-- =========================
CREATE TABLE income3 (
    income_id INT,              -- Unique income record ID
    user_id INT,                -- Foreign key referencing user
    amount DOUBLE,              -- Income amount
    source VARCHAR(100),        -- Source of income (cash/online)
    income_date DATE            -- Date of income
);

-- Insert sample data into income table
INSERT INTO income3 (
    income_id,
    user_id,
    amount,
    source,
    income_date
)
VALUES
(111, 1, 50000, 'cash', '2026-02-25'),
(112, 2, 30000, 'cash', '2026-05-25'),
(113, 3, 45000, 'online', '2026-06-25');


-- =========================
-- CHECK DATA
-- =========================
SELECT * FROM user5;      -- View all users
SELECT * FROM income3;    -- View all income records


-- =========================
-- INNER JOIN (Standard Join)
-- Returns only matching records
-- =========================
SELECT 
    u.user_id,
    u.name,
    u.email,
    i.income_id,
    i.amount,
    i.source,
    i.income_date
FROM user5 u
INNER JOIN income3 i 
ON u.user_id = i.user_id;


-- =========================
-- INNER JOIN (Old syntax using WHERE)
-- Same result as above
-- =========================
SELECT 
    u.user_id,
    u.name,
    u.email,
    i.income_id,
    i.amount,
    i.source,
    i.income_date
FROM user5 u, income3 i
WHERE u.user_id = i.user_id;


-- =========================
-- NATURAL JOIN
-- Automatically joins using common column (user_id)
-- =========================
SELECT 
    u.user_id,
    u.name,
    u.email,
    i.income_id,
    i.amount,
    i.source,
    i.income_date
FROM user5 u
NATURAL JOIN income3 i;


-- =========================
-- LEFT JOIN
-- Returns all users + matching income (NULL if no match)
-- =========================
SELECT 
    u.user_id,
    u.name,
    u.email,
    i.income_id,
    i.amount,
    i.source,
    i.income_date
FROM user5 u
LEFT OUTER JOIN income3 i 
ON u.user_id = i.user_id;


-- =========================
-- RIGHT JOIN
-- Returns all income + matching users
-- =========================
SELECT 
    u.user_id,
    u.name,
    u.email,
    i.income_id,
    i.amount,
    i.source,
    i.income_date
FROM user5 AS u
RIGHT JOIN income3 i 
ON u.user_id = i.user_id;


-- =========================
-- FULL OUTER JOIN (Simulated using UNION)
-- Combines LEFT + RIGHT JOIN
-- NOTE: user7 & income4 must exist for this query
-- =========================
SELECT 
    u.user_id,
    u.name,
    i.income_id,
    i.amount,
    i.source,
    i.income_date
FROM user7 u
LEFT JOIN income4 i 
ON u.user_id = i.user_id

UNION

SELECT 
    u.user_id,
    u.name,
    i.income_id,
    i.amount,
    i.source,
    i.income_date
FROM user7 u
RIGHT JOIN income4 i 
ON u.user_id = i.user_id;


-- =========================
-- CROSS JOIN
-- Returns all possible combinations of rows
-- NOTE: user7 & income4 must exist
-- =========================
SELECT 
    u.user_id,
    u.name,
    i.income_id,
    i.amount,
    i.source
FROM user7 u
CROSS JOIN income4 i;
