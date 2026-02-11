USE Personal_expence;
CREATE TABLE expense (
    expense_id INT PRIMARY KEY,
    user_id INT,
    category VARCHAR(100),
    amount DECIMAL(10,2),
    expense_date DATE,
    payment_mode VARCHAR(50),
    note VARCHAR(255)
);
INSERT INTO expense (expense_id,user_id, category, amount, expense_date, payment_mode, note)
VALUES
(100 , 1, 'Food', 500.00, '2026-02-01', 'Cash', 'Lunch'),
(101 ,2, 'Travel', 1200.50, '2026-02-05', 'Card', 'Bus ticket'),
(102 ,1, 'Health', 800.00, '2026-02-08', 'UPI', 'Medicine');

CREATE TABLE income (
    income_id INT PRIMARY KEY,
    user_id INT,
    amount DECIMAL(10,2),
    source VARCHAR(100),
    income_date DATE
);
INSERT INTO income (income_id,user_id, amount, source, income_date)
VALUES
( 1,1, 25000.00, 'Salary', '2026-02-01'),
( 2,2, 5000.00, 'Freelancing', '2026-02-05'),
( 3 ,1, 2000.00, 'Bonus', '2026-02-10');

SELECT * FROM income;
SELECT * FROM expense;


SELECT USER_ID  FROM income
UNION
SELECT USER_ID  FROM expense


SELECT USER_ID  FROM income
UNION ALL
SELECT uSER_ID  FROM expense
