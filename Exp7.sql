USE personal_expence
CREATE TABLE Budget1 (
    budget_id INT PRIMARY KEY,
    user_id INT,
    category_id INT NOT NULL,
    monthly_limit INT
);

INSERT INTO Budget1 (budget_id,user_id, category_id, monthly_limit) VALUES
(111,1, 101, 5000),
(222,1, 102, 3000),
(333,2, 101, 7000),
(444,2, 103, 4000),
(555,3, 104, 6000);

SELECT * FROM Budget1;

insert into Budget values (666,4,null,8000);

CREATE TABLE User (
    user_id INT PRIMARY KEY,
    name VARCHAR(100),
    email VARCHAR(100),
    password VARCHAR(100) CHECK (CHAR_LENGTH(password) >= 8),
    created_at VARCHAR(50) default '2026-02-25'
);
INSERT INTO User (user_id, name, email, password, created_at) VALUES
(1, 'Hadeen', 'hadeen@gmail.com', 'pass1234', '2026-02-25'),
(2, 'Ali', 'ali@gmail.com', 'ali@2026', '2026-02-24'),
(3, 'Sara', 'sara@gmail.com', 'sara', '2026-02-23');

CREATE TABLE Income (
    income_id INT PRIMARY KEY,
    user_id INT,
    amount DOUBLE,
    source VARCHAR(100),
    income_date INT
);

CREATE TABLE Income1 (
    income_id INT ,
    salary int PRIMARY KEY,
    username varchar(100),
    
    foreign key (income_id) references Income(income_id)
    
);

INSERT INTO Income1 (income_id, salary, username) VALUES
(1, 50000, 'Hadeen'),
(2, 30000, 'Ali'),
(3, 45000, 'Sara');

select * from budget1;
select * from user
