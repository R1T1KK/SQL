#Inner and outer joins in a given database
  
use personal_expence
create table user5 (
	user_id int,
	name varchar (100),
    Email varchar (150),
    PASSWORD VARCHAR (100),
    created_at varchar (100)
);
select * from user5;

insert into user5 (	user_id,name ,Email,PASSWORD,created_at )Values 
  
    (1, 'Hadeen', 'hadeen@gmail.com', 'pass1234', '2026-02-25'),
      (2, 'Ali', 'ali@gmail.com', 'ali@2026', '2026-02-24'),
        (3, 'Sara', 'sara@gmail.com', 'sara', '2026-02-23');
