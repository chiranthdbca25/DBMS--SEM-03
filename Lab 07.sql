--Lab -07 
--Implement different types of Joins: Implement various types of joins in SQL, including Inner Join, Outer Join, and Natural Join, with suitable examples.
--Solution:
CREATE DATABASE Student_DB;
USE Student_DB;

CREATE TABLE Department (
    dept_id INT PRIMARY KEY,
    dept_name VARCHAR(50)
);

CREATE TABLE Student (
    student_id INT PRIMARY KEY,
    student_name VARCHAR(50),
    age INT,
    dept_id INT,
    FOREIGN KEY (dept_id) REFERENCES Department(dept_id)
);

CREATE TABLE Course (
    course_id INT PRIMARY KEY,
    course_name VARCHAR(50),
    credits INT
);

CREATE TABLE Enrollment (
    enrollment_id INT PRIMARY KEY,
    student_id INT,
    course_id INT,
    FOREIGN KEY (student_id) REFERENCES Student(student_id),
    FOREIGN KEY (course_id) REFERENCES Course(course_id)
);

CREATE TABLE Marks (
    mark_id INT PRIMARY KEY,
    student_id INT,
    course_id INT,
    marks INT,
    FOREIGN KEY (student_id) REFERENCES Student(student_id),
    FOREIGN KEY (course_id) REFERENCES Course(course_id)
);

INSERT INTO Department VALUES
(1,'Computer Science'),
(2,'Commerce'),
(3,'Mathematics');

INSERT INTO Student VALUES
(101,'Chiranth',20,1),
(102,'Rahul',19,1),
(103,'Priya',21,2),
(104,'Sneha',20,NULL);

INSERT INTO Course VALUES
(201,'DBMS',4),
(202,'Java',3),
(203,'Statistics',4);

INSERT INTO Enrollment VALUES
(1,101,201),
(2,101,202),
(3,102,201),
(4,103,203);

INSERT INTO Marks VALUES
(1,101,201,90),
(2,101,202,85),
(3,102,201,75),
(4,103,203,80);

SELECT Student.student_id,
       Student.student_name,
       Department.dept_name
FROM Student
INNER JOIN Department
ON Student.dept_id = Department.dept_id;
 
SELECT Student.student_name,
       Department.dept_name
FROM Student
LEFT JOIN Department
ON Student.dept_id = Department.dept_id;
 
SELECT Student.student_name,
       Department.dept_name
FROM Student
RIGHT JOIN Department
ON Student.dept_id = Department.dept_id;
 
SELECT Student.student_name,
       Department.dept_name
FROM Student
LEFT JOIN Department
ON Student.dept_id = Department.dept_id
UNION
SELECT Student.student_name,
       Department.dept_name
FROM Student
RIGHT JOIN Department
ON Student.dept_id = Department.dept_id;
 
SELECT student_id, student_name, dept_name
FROM Student
NATURAL JOIN Department;
 
