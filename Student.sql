# Creating the 2 Tables and define relation between them 
CREATE DATABASE profile;
USE profile;
#Parent Table
CREATE TABLE students (
    student_id INT PRIMARY KEY,
    name VARCHAR(50)
);
#Child Table
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

INSERT INTO test_attempts(attempt_id,student_id,subject,score)
VALUES
(105,1,'JEE Math Mock',92),
(106,3,'JEE Math Mock',94),
(107,1,'JEE Math Mock',97),
(108,1,'JEE Math Mock',89);

SELECT attempt_id,subject,score 
FROM test_attempts 
WHERE subject = 'JEE Math Mock' 
ORDER BY score DESC;
-- LIMIT = 5;

INSERT INTO test_attempts (attempt_id,student_id,subject,score)
VALUES 
(109, 1, 'JEE Math Mock', 94),
(110, 3, 'JEE Math Mock', 98),
(111, 1, 'JEE Math Mock', 91),
(112, 1, 'JEE Math Mock', 97);

#Sub Query
SELECT attempt_id, subject, score
FROM (
    SELECT attempt_id, subject, score 
    FROM test_attempts
    ORDER BY score DESC
    Limit 7
) AS top_scores
WHERE subject = 'JEE Math Mock'
ORDER BY score ASC;
#Inner Join -> Show only Intersecting values, Drop values that are not intersecting
SELECT *
FROM students
INNER JOIN test_attempts ON test_attempts.student_id = students.student_id;

SELECT students.name, test_attempts.subject, AVG(test_attempts.score) AS average_score
FROM test_attempts
INNER JOIN students ON students.student_id = test_attempts.student_id
GROUP BY students.name, test_attempts.subject
ORDER BY average_score DESC;

#Left Join -> Show all values, Don't drop values that are not intersecting 
SELECT students.name, COUNT(test_attempts.attempt_id) AS total_tests_taken
FROM students
LEFT JOIN test_attempts ON students.student_id = test_attempts.student_id
GROUP BY students.name
ORDER BY total_tests_taken DESC;

#Update Values in the table
UPDATE test_attempts
SET score = score + 1;

SELECT * FROM test_attempts;

#Forcing MySQL to check foreign key values 
SET FOREIGN_KEY_CHECKS = 1;

#Drop child table
DROP TABLE IF EXISTS test_attempts;

#Drop Parent table 
DROP TABLE IF EXISTS students;

#Parent Table
CREATE TABLE students (
    student_id INT PRIMARY KEY,
    name VARCHAR(50)
);

#INSERT in Parent Class
INSERT INTO students (student_id, name)
VALUES 
(1, 'Yash'),
(2, 'Rahul'),
(3, 'Ram');

#CASCADE Concept -> If change occurs in parent table then it also reflects in child table 
CREATE TABLE test_attempts (
    attempt_id INT PRIMARY KEY,
    student_id INT,
    subject VARCHAR(50),
    score INT,
    FOREIGN KEY (student_id) REFERENCES students (student_id)
    ON UPDATE CASCADE
    ON DELETE CASCADE
)ENGINE = InnoDB;;

INSERT INTO
    test_attempts (
        attempt_id,
        student_id,
        subject,
        score
    )
VALUES 
(101,1,'JEE Physics Mock',89),
(102, 1, 'JEE Math Mock', 95),
(103,2,'NEET Biology Mock',85),
(104,3,'JEE Chemistry Mock',99),
(105, 1, 'JEE Math Mock', 92),
(106, 3, 'JEE Math Mock', 94),
(107, 1, 'JEE Math Mock', 97),
(108, 1, 'JEE Math Mock', 89),
(109, 1, 'JEE Math Mock', 94),
(110, 3, 'JEE Math Mock', 98),
(111, 1, 'JEE Math Mock', 91),
(112, 1, 'JEE Math Mock', 97);

SELECT * FROM test_attempts;

#UPDATE Parent Class value
UPDATE students
SET student_id = 9
WHERE student_id = 1;

SELECT * FROM students;
SELECT * FROM test_attempts;
