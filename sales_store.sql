
DROP TABLE IF EXISTS book;
create table book(isbn	varchar(20),
book_title	varchar(100),
category	varchar(100),
rental_price	float,
status	varchar(8),
author	varchar(100),
publisher	varchar(100)	
);
DROP TABLE IF EXISTS branch;

CREATE TABLE branch(	
    branch_id VARCHAR(8) PRIMARY KEY,
    manager_id VARCHAR(8),
    branch_address VARCHAR(50),  -- increased size to avoid truncation
    phone VARCHAR(20)            -- even though it's number, keep as string to avoid scientific notation
);

DROP TABLE IF EXISTS employee;

create table employee(emp_id	varchar(10) primary key,
emp_name	varchar(20),
position	varchar(20),
salary	int,
branch_id  varchar(20) 
);


create table member (	member_id	varchar(10)primary key,
	member_name	 varchar(20),
	member_address		varchar(20),
	reg_date		date
);


-- Insert records into return_book table
INSERT INTO return_book (return_id, issued_id, return_date) VALUES
('RS102', 'IS105', '2023-06-07'),
('RS103', 'IS103', '2023-08-20'),
('RS105', 'IS107', '2024-05-03'),
('RS106', 'IS108', '2024-05-05'),
('RS108', 'IS110', '2024-05-09'),
('RS109', 'IS111', '2024-05-11'),
('RS110', 'IS112', '2024-05-13'),
('RS111', 'IS113', '2024-05-15'),
('RS112', 'IS114', '2024-05-17'),
('RS113', 'IS115', '2024-05-19'),
('RS114', 'IS116', '2024-05-21'),
('RS115', 'IS117', '2024-05-23'),
('RS116', 'IS118', '2024-05-25'),
('RS117', 'IS119', '2024-05-27'),
('RS118', 'IS120', '2024-05-29');
SELECT * FROM member
UPDATE member 
SET member_address = '125 Main St'
WHERE member_id = 'C101';
SELECT *
FROM employee AS el
JOIN branch AS b ON b.branch_id = el.branch_id
JOIN employee AS e2 ON b.manager_id = e2.emp_id;







