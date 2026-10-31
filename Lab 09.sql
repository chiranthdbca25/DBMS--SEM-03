--Lab 09
--Implement Procedure (Basic procedure, procedure for Insert, Update and Delete)

CREATE DATABASE Lab9_Procedures;
USE Lab9_Procedures;

CREATE TABLE Student (
    student_id INT PRIMARY KEY,
    student_name VARCHAR(50),
    age INT,
    dept_id INT
);

INSERT INTO Student VALUES
(101, 'Chiranth', 20, 1),
(102, 'Rahul', 19, 1),
(103, 'Priya', 21, 2),
(104, 'Sneha', 20, 2);

SELECT * FROM Student;
 

-- QUERY 1: BASIC PROCEDURE
DELIMITER //

CREATE PROCEDURE DisplayStudents()
BEGIN
    SELECT * FROM Student;
END //

DELIMITER ;

-- EXECUTE PROCEDURE
CALL DisplayStudents();
 


-- QUERY 2: INSERT PROCEDURE
DELIMITER //

CREATE PROCEDURE InsertStudent(
    IN sid INT,
    IN sname VARCHAR(50),
    IN sage INT,
    IN did INT
)
BEGIN
    INSERT INTO Student
    VALUES (sid, sname, sage, did);
END //

DELIMITER ;

-- EXECUTE INSERT PROCEDURE
CALL InsertStudent(105, 'Arjun', 22, 1);

-- DISPLAY INSERTED RECORD
SELECT * FROM Student;
 

-- QUERY 3: UPDATE PROCEDURE
DELIMITER //

CREATE PROCEDURE UpdateStudent(
    IN sid INT,
    IN new_age INT
)
BEGIN
    UPDATE Student
    SET age = new_age
    WHERE student_id = sid;
END //

DELIMITER ;

-- EXECUTE UPDATE PROCEDURE
CALL UpdateStudent(105, 23);

-- DISPLAY UPDATED RECORD
SELECT * FROM Student
WHERE student_id = 105;

 
-- QUERY 4: DELETE PROCEDURE
DELIMITER //

CREATE PROCEDURE DeleteStudent(
    IN sid INT
)
BEGIN
    DELETE FROM Student
    WHERE student_id = sid;
END //

DELIMITER ;
-- EXECUTE DELETE PROCEDURE
CALL DeleteStudent(105);
-- DISPLAY FINAL TABLE
SELECT * FROM Student;
 
