#1. Create Parent Table
CREATE TABLE departments (
    dept_id INT PRIMARY KEY,
    dept_name VARCHAR(50) NOT NULL
) ENGINE = InnoDB;

#2. Create Child Table
CREATE TABLE employees (
    emp_id INT PRIMARY KEY,
    emp_name VARCHAR(50) NOT NULL,
    dept_id INT
) ENGINE = InnoDB;

#3. Insert Dummy Data
INSERT INTO
    departments (dept_id, dept_name)
VALUES (1, 'Engineering'),
    (2, 'Marketing');

INSERT INTO
    employees (emp_id, emp_name, dept_id)
VALUES (101, 'Alice', 1),
    (102, 'Bob', 2);

ALTER TABLE employees 
ADD COLUMN email VARCHAR(100);

ALTER TABLE departments 
MODIFY COLUMN dept_name VARCHAR(100);

ALTER TABLE employees
ADD CONSTRAINT fk_department FOREIGN KEY (dept_id) REFERENCES departments (dept_id) 
ON UPDATE CASCADE 
ON DELETE CASCADE;

