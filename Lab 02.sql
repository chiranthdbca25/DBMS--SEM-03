CREATE TABLE Student (
    student_id INT PRIMARY KEY,
    student_name VARCHAR(100) NOT NULL,
    email VARCHAR(100) UNIQUE,
    phone_number VARCHAR(15),
    date_of_birth DATE,
    gender VARCHAR(10),
    department_id INT
);

INSERT INTO Student VALUES
(3001, 'Vikram Hegde', 'vikram.hegde@example.com', '9811223344', '2005-03-15', 'Male', 20201),
(3002, 'Divya Kulkarni', 'divya.kulkarni@example.com', '9722334455', '2006-07-22', 'Female', 20202),
(3003, 'Siddharth Joshi', 'siddharth.j@example.com', '9633445566', '2005-11-08', 'Male', 20201),
(3004, 'Kavya Deshmukh', 'kavya.d@example.com', '9544556677', '2006-01-30', 'Female', 20203),
(3005, 'Nikhil Shetty', 'nikhil.shetty@example.com', '9455667788', '2005-09-18', 'Male', 20202);

SELECT * FROM Student;

UPDATE Student
SET phone_number = '123456789'
WHERE date_of_birth = '2006-07-22 ';

SELECT * FROM Student
WHERE date_of_birth = '2006-07-22 ';


DELETE FROM Student
WHERE student_id = 3003;

SELECT * FROM Student;
