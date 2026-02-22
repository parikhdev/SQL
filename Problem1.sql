CREATE DATABASE PrepX;
USE PrepX;
CREATE TABLE employee(
    id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(50),
    salary BIGINT
);
INSERT INTO employee(name,salary)
Values 
("adam", 35000),
("bob", 40000),
("casey", 25000);
SELECT * FROM employee;