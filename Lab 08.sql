--Lab - 08
--Implement Grouping and Ordering: Study and implement the GROUP BY  and HAVING clauses, ORDER BY clause.
CREATE DATABASE Lab8_Grouping;
USE Lab8_Grouping;
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
CREATE TABLE Marks (
    mark_id INT PRIMARY KEY,
    student_id INT,
    subject VARCHAR(50),
    marks INT,
    FOREIGN KEY (student_id) REFERENCES Student(student_id)
);

INSERT INTO Department VALUES
(1, 'Computer Science'),
(2, 'Commerce'),
(3, 'Mathematics');

INSERT INTO Student VALUES
(101, 'Chiranth', 20, 1),
(102, 'Rahul', 19, 1),
(103, 'Priya', 21, 2),
(104, 'Sneha', 20, 2),
(105, 'Arjun', 22, 3);

INSERT INTO Marks VALUES
(1, 101, 'DBMS', 90),
(2, 102, 'DBMS', 75),
(3, 103, 'DBMS', 85),
(4, 104, 'DBMS', 65),
(5, 105, 'DBMS', 95);

SELECT * FROM Student;
 

-- QUERY 1: GROUP BY
SELECT dept_id, COUNT(*) AS Total_Students
FROM Student
GROUP BY dept_id;
 

-- QUERY 2: GROUP BY WITH HAVING
SELECT dept_id, COUNT(*) AS Total_Students
FROM Student
GROUP BY dept_id
HAVING COUNT(*) >= 2;
 

-- QUERY 3: ORDER BY ASCENDING
SELECT * FROM Student
ORDER BY student_name ASC;
 


-- QUERY 4: ORDER BY DESCENDING
SELECT * FROM Student
ORDER BY age DESC;
 

-- QUERY 5: GROUP BY WITH AVERAGE
SELECT subject, AVG(marks) AS Average_Marks
FROM Marks
GROUP BY subject;
 
-- QUERY 6: HAVING WITH AVG
SELECT subject, AVG(marks) AS Average_Marks
FROM Marks
GROUP BY subject
HAVING AVG(marks) >= 80;
 
-- QUERY 7: ORDER BY MARKS
SELECT * FROM Marks
ORDER BY marks DESC;
 
