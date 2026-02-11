--------------------------------------------------
-- SELECT DATABASE
--------------------------------------------------

-- Select the database to work with
USE Personal_expence;

--------------------------------------------------
-- CREATE TABLE
--------------------------------------------------

-- Create AGGRIGATE table to store budget details
CREATE TABLE AGGRIGATE
(
    budget_id INT,              -- Unique budget ID
    user_id INT,                -- User ID
    category_id VARCHAR(255),   -- Expense category
    monthly_limit INT           -- Monthly budget limit
);

--------------------------------------------------
-- INSERT DATA
--------------------------------------------------

-- Insert records into AGGRIGATE table
INSERT INTO AGGRIGATE VALUES (111, 1, 'Health', 5000);
INSERT INTO AGGRIGATE VALUES (112, 2, 'EMI', 10000);
INSERT INTO AGGRIGATE VALUES (113, 3, 'Education fees', 15000);
INSERT INTO AGGRIGATE VALUES (114, 4, 'Home loan', 25000);

--------------------------------------------------
-- AGGREGATE FUNCTIONS
--------------------------------------------------

-- 1. Calculate total monthly budget (SUM)
SELECT SUM(monthly_limit) AS TotalBudget
FROM AGGRIGATE;

-- 2. Calculate SUM where user_id = 3 (1 + 2 = 3)
SELECT SUM(monthly_limit) AS SumForUser3
FROM AGGRIGATE
WHERE user_id = 1 + 2;

--------------------------------------------------
-- MINIMUM VALUE
--------------------------------------------------

-- 3. Find minimum monthly_limit
SELECT MIN(monthly_limit) AS MinimumLimit
FROM AGGRIGATE;

-- 4. Minimum monthly_limit with alias
SELECT MIN(monthly_limit) AS monthly_limit
FROM AGGRIGATE;

-- 5. Minimum monthly_limit grouped by budget_id
-- (Since budget_id is unique, result will be same value)
SELECT budget_id, MIN(monthly_limit) AS monthly_limit
FROM AGGRIGATE
GROUP BY budget_id;

--------------------------------------------------
-- MAXIMUM VALUE
--------------------------------------------------

-- 6. Find maximum monthly_limit
SELECT MAX(monthly_limit) AS MaximumLimit
FROM AGGRIGATE;

-- 7. Maximum monthly_limit with alias
SELECT MAX(monthly_limit) AS monthly_limit
FROM AGGRIGATE;

-- 8. Maximum monthly_limit grouped by budget_id
SELECT budget_id, MAX(monthly_limit) AS monthly_limit
FROM AGGRIGATE
GROUP BY budget_id;

--------------------------------------------------
-- AVERAGE VALUE
--------------------------------------------------

-- 9. Calculate average monthly_limit
SELECT AVG(monthly_limit) AS AverageLimit
FROM AGGRIGATE;

-- 10. Average monthly_limit with alias
SELECT AVG(monthly_limit) AS avg_limit
FROM AGGRIGATE;

-- 11. Average monthly_limit grouped by budget_id
SELECT budget_id, AVG(monthly_limit) AS monthly_limit
FROM AGGRIGATE
GROUP BY budget_id;

--------------------------------------------------
-- HIGHER AND LOWER THAN AVERAGE
--------------------------------------------------

-- 12. Categories with monthly_limit higher than average
SELECT category_id, monthly_limit
FROM AGGRIGATE
WHERE monthly_limit >
      (SELECT AVG(monthly_limit) FROM AGGRIGATE);

-- 13. Categories with monthly_limit lower than average
SELECT category_id, monthly_limit
FROM AGGRIGATE
WHERE monthly_limit <
      (SELECT AVG(monthly_limit) FROM AGGRIGATE);

--------------------------------------------------
-- COUNT FUNCTIONS
--------------------------------------------------

-- 14. Count total number of records
SELECT COUNT(*) AS TotalRecords
FROM AGGRIGATE;

-- 15. Count monthly_limit records for user_id = 1
SELECT COUNT(monthly_limit) AS CountForUser1
FROM AGGRIGATE
WHERE user_id = 1;

-- 16. Count distinct monthly_limit values
SELECT COUNT(DISTINCT monthly_limit) AS UniqueLimits
FROM AGGRIGATE;

-- 17. Count total records with alias
SELECT COUNT(*) AS NumberOfRecords
FROM AGGRIGATE;

--------------------------------------------------
-- LIKE OPERATOR (PATTERN MATCHING)
--------------------------------------------------

-- Categories starting with 'H'
SELECT * FROM AGGRIGATE
WHERE category_id LIKE 'H%';

-- Categories ending with 'h'
SELECT * FROM AGGRIGATE
WHERE category_id LIKE '%h';

-- Categories containing 'FE'
SELECT * FROM AGGRIGATE
WHERE category_id LIKE '%FE%';

-- Categories starting with 'H' and ending with 'h'
SELECT * FROM AGGRIGATE
WHERE category_id LIKE 'H%h';

--------------------------------------------------
-- STRING FUNCTIONS
--------------------------------------------------

-- Concatenate user_id and category_id
SELECT CONCAT(USER_ID, '', category_id, '') AS FULLNAME
FROM AGGRIGATE;

-- Concatenate using underscore between values
SELECT CONCAT_WS('_', USER_ID, category_id) AS FULLNAME
FROM AGGRIGATE;

-- Reverse category_id string
SELECT REVERSE(category_id) AS ReversedCategory
FROM AGGRIGATE;

-- Find length of category_id
SELECT CHARACTER_LENGTH(category_id) AS length
FROM AGGRIGATE;

-- Convert category_id to uppercase
SELECT UPPER(category_id) AS UPPERCASE
FROM AGGRIGATE;

-- Replace letter 'H' with 'C' in category_id
SELECT REPLACE(category_id, 'H', 'C') AS replaced_category
FROM AGGRIGATE;

