CREATE DATABASE college;
USE college;
CREATE TABLE students(
    id INT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(50),
    progress_score INT
);
INSERT INTO students 
(name, progress_score)
VALUES 
('Yash', 100),
('Mohit', 85);

INSERT INTO students
(name, progress_score)
VALUES
('Ram', 100);
SELECT * FROM students;
DELETE FROM students
WHERE name = 'Mohit';

SELECT * FROM students;



