SET FOREIGN_KEY_CHECKS = 1;

DROP TABLE IF EXISTS enrollments;

DROP TABLE IF EXISTS courses;

CREATE TABLE courses (
    course_id INT PRIMARY KEY,
    course_name VARCHAR(50)
) ENGINE = InnoDB;

CREATE TABLE enrollments (
    enrollment_id INT PRIMARY KEY,
    course_id INT,
    student_name VARCHAR(50),
    FOREIGN KEY (course_id) REFERENCES courses (course_id) ON UPDATE CASCADE ON DELETE CASCADE
) ENGINE = InnoDB;

INSERT INTO
    courses (course_id, course_name)
VALUES (1, 'Data Structures'),
    (2, 'Machine Learning');

INSERT INTO
    enrollments (
        enrollment_id,
        course_id,
        student_name
    )
VALUES (101, 1, 'Yash'),
    (102, 1, 'Rohan'),
    (103, 2, 'Aisha');

UPDATE courses SET course_id = 9 WHERE course_id = 1;

SELECT * FROM courses;

SELECT * FROM enrollments;