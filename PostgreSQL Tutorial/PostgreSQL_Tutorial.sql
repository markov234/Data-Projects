-- This is a comment

-- This is my first table

-- INT 1, 2, 3, 4, 5, .... 9, 0, 125, 273874
-- VARCHAR() abcdjiejdsoj
-- CHAR(10)
-- BOOLEAN TRUE or FALSE
-- FLOAT 1.15, 255.61, 45.55
-- DECIMAL 12.3345 3242.4444
-- DATE 'YYYY-MM-DD'


CREATE TABLE students(
					id int, 
					name VARCHAR(25), 
					email_id VARCHAR(25), 
					JOD DATE
					);


SELECT * FROM students;

-- INSERTING VALUES

INSERT INTO students
VALUES
(101, 'rahul', 'rahul123@gmail.com', '2024-03-27')
;

SELECT * FROM students;

INSERT INTO students(id, name)
VALUES
(102, 'rex'),
(103, 'priya')
;

SELECT * FROM students;


-- DELETING TABLE

DROP TABLE students;


-- CREATING DATABASE

CREATE DATABASE my_second_db;






					