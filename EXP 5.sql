-- Use the database Personal_expence
USE Personal_expence;

--------------------------------------------------
-- Create expense table
--------------------------------------------------
CREATE TABLE expense (
    expense_id INT PRIMARY KEY,            -- Unique ID for each expense
    user_id INT,                           -- ID of the user who made the expense
    category VARCHAR(100),                 -- Expense category (Food, Travel, etc.)
    amount DECIMAL(10,2),                  -- Expense amount
    expense_date DATE,                      -- Date of the expense
    payment_mode VARCHAR(50),              -- Mode of payment (Cash, Card, UPI)
    note VARCHAR(255)                       -- Optional note/description
);

-- Insert sample data into expense table
INSERT INTO expense (expense_id,user_id, category, amount, expense_date, payment_mode, note)
VALUES
(100 , 1, 'Food', 500.00, '2026-02-01', 'Cash', 'Lunch'),
(101 ,2, 'Travel', 1200.50, '2026-02-05', 'Card', 'Bus ticket'),
(102 ,1, 'Health', 800.00, '2026-02-08', 'UPI', 'Medicine');

--------------------------------------------------
-- Create income table
--------------------------------------------------
CREATE TABLE income (
    income_id INT PRIMARY KEY,             -- Unique ID for each income
    user_id INT,                           -- ID of the user who received income
    amount DECIMAL(10,2),                  -- Income amount
    source VARCHAR(100),                    -- Source of income (Salary, Freelancing, etc.)
    income_date DATE                        -- Date of income
);

-- Insert sample data into income table
INSERT INTO income (income_id,user_id, amount, source, income_date)
VALUES
( 1,1, 25000.00, 'Salary', '2026-02-01'),
( 2,2, 5000.00, 'Freelancing', '2026-02-05'),
( 3 ,1, 2000.00, 'Bonus', '2026-02-10');

--------------------------------------------------
-- View the data in income and expense tables
--------------------------------------------------
SELECT * FROM income;
SELECT * FROM expense;

--------------------------------------------------
-- UNION examples
--------------------------------------------------
-- Get all unique user IDs from income and expense
SELECT USER_ID  FROM income
UNION
SELECT USER_ID  FROM expense;

-- Get all user IDs including duplicates
SELECT USER_ID  FROM income
UNION ALL
SELECT USER_ID  FROM expense;

--------------------------------------------------
-- INTERSECT and EXCEPT examples
-- Note: MySQL doesn't support INTERSECT/EXCEPT directly; requires workarounds
--------------------------------------------------
-- Intersection of amounts (common amounts in both tables)
SELECT AMOUNT  FROM income
INTERSECT 
SELECT AMOUNT  FROM expense;

-- Amounts in income but not in expense
SELECT AMOUNT  FROM income
EXCEPT
SELECT AMOUNT  FROM expense;

--------------------------------------------------
-- UNION multiple columns (amount and user_id)
--------------------------------------------------
SELECT amount,user_id
FROM expense
UNION
SELECT amount,user_id
FROM income;

-- Intersection of amount and user_id
SELECT amount,user_id
FROM expense
INTERSECT
SELECT amount,user_id
FROM income;

--------------------------------------------------
-- INNER JOIN example
-- Returns only users who have both income and expense
--------------------------------------------------
SELECT e.user_id, e.amount
FROM expense e
INNER JOIN income i
ON e.user_id = i.user_id;

--------------------------------------------------
-- LEFT JOIN example
-- Returns all expenses and matching income (NULL if no income)
--------------------------------------------------
SELECT e.user_id, e.amount
FROM expense e
LEFT JOIN income i
ON e.user_id = i.user_id;

--------------------------------------------------
-- RIGHT JOIN example
-- Returns all incomes and matching expense (NULL if no expense)
--------------------------------------------------
SELECT e.user_id, e.amount
FROM expense e
RIGHT JOIN income i
ON e.user_id = i.user_id;

--------------------------------------------------
-- Simulating FULL OUTER JOIN using LEFT + RIGHT + UNION
--------------------------------------------------
SELECT e.user_id, e.amount
FROM expense e
LEFT JOIN income i
ON e.user_id = i.user_id
UNION
SELECT e.user_id, e.amount
FROM expense e
RIGHT JOIN income i
ON e.user_id = i.user_id;

--------------------------------------------------
-- Create a simple view from expense table
--------------------------------------------------
CREATE VIEW user_expense_view AS
SELECT user_id, amount, category, expense_date
FROM expense;

-- Query the view
SELECT * FROM user_expense_view;

--------------------------------------------------
-- Create a view joining expense and income
--------------------------------------------------
CREATE VIEW user_fi_view AS
SELECT 
    e.user_id,
    e.amount AS expense_amount,
    e.category AS expense_category,
    e.expense_date,
    i.amount AS income_amount,
    i.source AS income_source,
    i.income_date
FROM expense e
JOIN income i
ON e.user_id = i.user_id;

-- Query the joined view
SELECT * FROM user_fi_view;

--------------------------------------------------
-- Create a view with a filter (amount > 5000)
--------------------------------------------------
CREATE VIEW user_fi_view AS
SELECT amount
FROM expense
WHERE amount > 5000;

-- Query the filtered view
SELECT * FROM user_fi_view;
