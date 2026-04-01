-- Create and use database

USE personal_expence;

-- =========================
-- CATEGORY TABLE
-- =========================
CREATE TABLE category1 (
    category_id INT PRIMARY KEY,
    category_name VARCHAR(60) NOT NULL,
    description VARCHAR(255)
);

-- Insert data into category
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
    user_id INT PRIMARY KEY,
    user_name VARCHAR(50) NOT NULL
);

-- Insert users
INSERT INTO users (user_id, user_name)
VALUES
(101, 'John'),
(102, 'Alice'),
(103, 'Bob'),
(104, 'Emma');

-- =========================
-- BUDGET TABLE
-- =========================
CREATE TABLE budgetx (
    budget_id INT PRIMARY KEY,
    user_id INT,
    category_id INT,
    monthly_limit INT
);

-- Insert data into budget
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
SELECT * FROM category;
SELECT * FROM users1;
SELECT * FROM budgetx;

DELETE FROM users1 WHERE user_id = 101;
SELECT * FROM users1;

UPDATE users1
SET user_id = 201
WHERE user_id = 101;
SELECT * FROM users1;



