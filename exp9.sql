-- =========================
-- USE DATABASE
-- =========================
USE personal_expence;

-- =========================
-- CATEGORY TABLE
-- =========================
CREATE TABLE category1 (
    category_id INT PRIMARY KEY,          -- Unique ID for each category
    category_name VARCHAR(60) NOT NULL,   -- Name of the category
    description VARCHAR(255)              -- Description of the category
);

-- Insert data into category1
INSERT INTO category1 (category_id, category_name, description)
VALUES
(1, 'Electronics', 'Devices like phones, laptops, and gadgets'),
(2, 'Clothing', 'Men and women apparel'),
(3, 'Books', 'Educational and entertainment books'),
(4, 'Furniture', 'Home and office furniture'),
(5, 'Groceries', 'Daily household food items');

-- =========================
-- USER TABLE
-- =========================
CREATE TABLE users1 (
    user_id INT PRIMARY KEY,              -- Unique ID for each user
    user_name VARCHAR(50) NOT NULL        -- Name of the user
);

-- Insert users (FIX: table name should be users1, not users)
INSERT INTO users1 (user_id, user_name)
VALUES
(101, 'John'),
(102, 'Alice'),
(103, 'Bob'),
(104, 'Emma');

-- =========================
-- BUDGET TABLE
-- =========================
CREATE TABLE budgetx (
    budget_id INT PRIMARY KEY,            -- Unique ID for each budget entry
    user_id INT,                          -- References users1 table
    category_id INT,                      -- References category1 table
    monthly_limit INT                     -- Budget limit for the category

    -- NOTE: No foreign keys added here yet
    -- Add ON DELETE/UPDATE CASCADE if needed
);

-- Insert data into budgetx
INSERT INTO budgetx (budget_id, user_id, category_id, monthly_limit)
VALUES
(1, 101, 1, 500),
(2, 101, 2, 300),
(3, 102, 3, 700),
(4, 102, 4, 400),
(5, 103, 5, 600);

-- =========================
-- VIEW DATA
-- =========================

-- FIX: table name should be category1, not category
SELECT * FROM category1;

SELECT * FROM users1;

SELECT * FROM budgetx;

-- =========================
-- DELETE OPERATION
-- =========================

-- Delete user with ID 101
-- (NOTE: This will fail if foreign key constraints exist without CASCADE)
DELETE FROM users1 
WHERE user_id = 101;

-- View updated users table
SELECT * FROM users1;

-- =========================
-- UPDATE OPERATION
-- =========================

-- Update user_id from 101 to 201
-- (NOTE: Will only affect if record still exists)
-- (With ON UPDATE CASCADE, related tables would also update automatically)
UPDATE users1
SET user_id = 201
WHERE user_id = 101;

-- View updated users table
SELECT * FROM users1;
