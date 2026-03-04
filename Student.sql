# Creating the 2 Tables and define relation between them 
CREATE DATABASE profile;
USE profile;
CREATE TABLE students (
    student_id INT PRIMARY KEY,
    name VARCHAR(50)
);
CREATE TABLE test_attempts (
    attempt_id INT PRIMARY KEY,
    student_id INT, 
    subject VARCHAR(50), 
    score INT,
    FOREIGN KEY (student_id) REFERENCES students (student_id)
);
INSERT INTO students (student_id, name)
VALUES 
(1, 'Yash'),
(2, 'Rahul'),
(3, 'Ram');
INSERT INTO test_attempts (attempt_id,student_id,subject,score)
VALUES
(101,1,'JEE Physics Mock',89),
(102,1,'JEE Math Mock', 95), 
(103,2,'NEET Biology Mock',85),
(104,3,'JEE Chemistry Mock',99);
SELECT * FROM students;
SELECT * FROM test_attempts;


