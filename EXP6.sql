# EXP 6
# Advanced DML Operations
USE personal_expence;

-- Step 1: Create expense_1 table to store expenses of users
CREATE TABLE expense1 (
    expense_id INT,            -- Unique ID for each expense
    user_id INT,               -- ID of the user who made the expense
    category VARCHAR(100),     -- Expense category (Food, Travel, etc.)
    amount INT,                -- Expense amount
    payment_mode VARCHAR(50),  -- Mode of payment (Cash, Card, UPI)
    note VARCHAR(255)          -- Optional note/description
);

-- Step 2: View the table (empty at this point)
SELECT * FROM expense_1;

-- Step 3: Add a column Expense_date (initially as INT, will modify later)
ALTER TABLE expense_1 ADD Expense_date INT;

-- Step 4: Change column type to DATE and make it NOT NULL, placing it at first position
ALTER TABLE expense_1 MODIFY COLUMN expense_date DATE NOT NULL FIRST;

-- Step 5: Adjust column position to be after expense_id
ALTER TABLE expense_1 MODIFY COLUMN expense_date DATE AFTER expense_id;

-- Step 6: Insert some sample expense data
INSERT INTO expense_1 
(expense_id, expense_date, user_id, category, amount, payment_mode, note)
VALUES
(100, '2026-02-01', 1, 'Food', 500, 'Cash', 'Lunch'),
(101, '2026-02-05', 2, 'Travel', 1200, 'Card', 'Bus ticket'),
(102, '2026-02-08', 1, 'Health', 800, 'UPI', 'Medicine'),
(103, '2026-03-08', 3, 'GYM', 1300, 'UPI', 'Workout');

-- Step 7: Display all expenses ordered by date
SELECT * FROM expense_1
ORDER BY expense_date;

-- Step 8: Display all expenses ordered by amount (highest first)
SELECT * FROM expense_1
ORDER BY amount DESC;

-- Step 9: Calculate average amount by payment mode for expenses greater than 600
SELECT AVG(amount) AS Avgamount, payment_mode
FROM expense_1
WHERE amount > 600
GROUP BY payment_mode;

-- Step 10: Count number of expenses per payment mode
SELECT payment_mode, COUNT(*)
FROM expense_1
GROUP BY payment_mode
HAVING COUNT(*) > 4;  -- Only show modes used more than 4 times

-- Step 11: Create another table expense_3 to store filtered expenses
CREATE TABLE expense_3 (
    expense_id INT,
    expense_date DATE,         -- Date of expense
    user_id INT,
    category VARCHAR(100),
    amount INT,
    payment_mode VARCHAR(50),
    note VARCHAR(255)
);

-- Step 12: Insert into expense_3 only expenses with amount > 600
INSERT INTO expense_3
(expense_id, expense_date, user_id, category, amount, payment_mode, note)
SELECT expense_id, expense_date, user_id, category, amount, payment_mode, note
FROM expense_1
WHERE amount > 600;

-- Step 13: Display expense_3
SELECT * FROM expense_3;

-- Step 14: Create a tax4 table to store tax information for expenses
CREATE TABLE tax4 (
    expense_id INT,
    tax_amount INT,    -- Amount of tax to add
    tax_per INT        -- Tax percentage (not used in update here)
);

-- Step 15: Insert tax data for some expenses
INSERT INTO tax4 (expense_id, tax_amount, tax_per) VALUES
(100, 200, 15),
(101, 201, 16),
(102, 202, 17);

-- Step 16: View tax4 table
SELECT * FROM tax4;

-- Step 17: Update expense_1 table to add tax_amount from tax4 to amount
UPDATE expense_1 a
JOIN tax4 t
ON a.expense_id = t.expense_id
SET a.amount = a.amount + t.tax_amount;

-- Step 18: View updated expense_1 table
SELECT * FROM expense_1;

-- Step 19: Delete all expenses made by user_id = 1
DELETE FROM expense_1
WHERE user_id = 1;
