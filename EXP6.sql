#EXP 6
#Advanced DML operations 
USE personal_expence
  
CREATE TABLE expense_1 (
    expense_id INT,            -- Unique ID for each expense
    user_id INT,                           -- ID of the user who made the expense
    category VARCHAR(100),                 -- Expense category (Food, Travel, etc.)
    amount int,                  -- Expense amount
    payment_mode VARCHAR(50),              -- Mode of payment (Cash, Card, UPI)
    note VARCHAR(255)                       -- Optional note/description
);
Select * from expense_1

alter table expense_1 add Expense_date int;

alter table expense_1 modify column expense_date date not null first;

alter table expense_1 modify column expense_date date after expense_id;

INSERT INTO expense_1 
(expense_id, expense_date, user_id, category, amount, payment_mode, note)
VALUES
(100, '2026-02-01', 1, 'Food', 500, 'Cash', 'Lunch'),
(101, '2026-02-05', 2, 'Travel', 1200, 'Card', 'Bus ticket'),
(102, '2026-02-08', 1, 'Health', 800, 'UPI', 'Medicine'),
(103, '2026-03-08', 3, 'GYM', 1300, 'UPI', 'Workout');
Select * from expense_1
order by expense_date 

Select * from expense_1
order by amount desc

select avg(amount) as Avgamount,payment_mode
from expense_1
where amount>600
group by Payment_mode

select payment_mode, count(*)
from expense_1
group by Payment_mode
having count(*) > 4;

CREATE TABLE expense_3 (
    expense_id INT, 
    expense_date date,-- Unique ID for each expense
    user_id INT,                           -- ID of the user who made the expense
    category VARCHAR(100),                 -- Expense category (Food, Travel, etc.)
    amount int,                  -- Expense amount
    payment_mode VARCHAR(50),              -- Mode of payment (Cash, Card, UPI)
    note VARCHAR(255)                       -- Optional note/description
);

INSERT INTO expense_3
(expense_id, expense_date, user_id, category, amount, payment_mode, note)
select expense_id, expense_date, user_id, category, amount, payment_mode, note
from expense_1
where amount>600;
select * from expense_3

CREATE TABLE tax4 (
    expense_id INT,
    tax_amount INT,
    tax_per INT
);

INSERT INTO tax4 (expense_id,tax_amount, tax_per) VALUES
(100,200,15),
(101,201,16),
(102,202,17);
select * from tax4


UPDATE expense_1 a
JOIN tax4 t
ON a.expense_id = t.expense_id
SET a.amount = a.amount +  t.tax_amount


select * from expense_1;
DELETE FROM expense_1
WHERE user_id = 1;
