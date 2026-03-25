USE personal_expence;

-- USER TABLE
CREATE TABLE user5 (
    user_id INT,
    name VARCHAR(100),
    email VARCHAR(150),
    password VARCHAR(100),
    created_at DATE
);

INSERT INTO user5 (
    user_id, name, email, password, created_at
) VALUES
(1, 'Hadeen', 'hadeen@gmail.com', 'pass1234', '2026-02-25'),
(2, 'Ali', 'ali@gmail.com', 'ali@2026', '2026-02-24'),
(3, 'Sara', 'sara@gmail.com', 'sara', '2026-02-23');


-- INCOME TABLE (FIXED NAME + COLUMN SPELLING)
CREATE TABLE income3 (
    income_id INT,
    user_id INT,
    amount DOUBLE,
    source VARCHAR(100),
    income_date DATE
);

INSERT INTO income3 (
    income_id,
    user_id,
    amount,
    source,
    income_date
) VALUES
(111, 1, 50000, 'cash', '2026-02-25'),
(112, 2, 30000, 'cash', '2026-05-25'),
(113, 3, 45000, 'online', '2026-06-25');


-- CHECK DATA
SELECT * FROM user5;
SELECT * FROM income3;

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
