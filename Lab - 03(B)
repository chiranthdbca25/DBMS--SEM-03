CREATE TABLE STUDENT (
    Student_ID INT,
    Student_Name VARCHAR(50),
    Class VARCHAR(10),
    Marks INT,
    Fee_Paid DECIMAL(10,2),
    Date_of_Birth DATE,
    Admission_Date DATE
);

INSERT INTO STUDENT VALUES  
(101, 'Aarav Sharma', '10th', 485, 25000.00, '2008-05-14', '2022-04-10'),
(102, 'Ananya Verma', '10th', 462, 25000.00, '2008-09-22', '2022-04-12'),
(103, 'Rohan Mehta', '9th', 390, 18500.50, '2009-01-30', '2023-04-05'),
(104, 'Priya Singh', '11th', 495, 30000.00, '2007-11-08', '2021-06-15'),
(105, 'Kabir Nair', '9th', 415, 20000.00, '2009-07-19', '2023-04-18');
SELECT * FROM Student;

/* Common String Functions */
SELECT Student_Name,
    UPPER(Student_Name) AS Uppercase_Name
FROM STUDENT;

SELECT Student_Name,
       LOWER(Student_Name) AS Lowercase_Name
FROM STUDENT;

SELECT Student_Name,
       LENGTH(Student_Name) AS Name_Length
FROM STUDENT;

SELECT CONCAT(Student_Name, ' - Class ', Class) AS Student_Details
FROM STUDENT;

SELECT Student_Name,
       SUBSTRING(Student_Name, 1, 5) AS First_Five_Characters
FROM STUDENT;

SELECT 
    Student_Name AS Original_Name,
    TRIM(Student_Name) AS Cleaned_Name
FROM STUDENT;

/* Numeric Functions */
SELECT Student_Name,
       Marks,
       ROUND(Marks * 1.05) AS Bonus_Marks
FROM STUDENT;

SELECT Student_Name,
       Marks / 10.0 AS Marks_Value,
       CEIL(Marks / 10.0) AS Rounded_Up
FROM STUDENT;

SELECT Student_Name,
       Marks / 10.0 AS Marks_Value,
       FLOOR(Marks / 10.0) AS Rounded_Down
FROM STUDENT;

SELECT Student_Name,
       Marks,
       MOD(Marks, 10) AS Remainder
FROM STUDENT;

SELECT Student_Name,
       Marks,
       ABS(Marks - 80) AS Difference_From_80
FROM STUDENT;

/* Date Functions */
SELECT Student_Name,
       Date_of_Birth,
       YEAR(Date_of_Birth) AS Birth_Year
FROM STUDENT;

SELECT Student_Name,
       Date_of_Birth,
       MONTH(Date_of_Birth) AS Birth_Month
FROM STUDENT;

SELECT Student_Name,
       Date_of_Birth,
       DAY(Date_of_Birth) AS Birth_Day
FROM STUDENT;

SELECT Student_Name,
       Date_of_Birth,
       TIMESTAMPDIFF(YEAR, Date_of_Birth, CURDATE()) AS Age
FROM STUDENT;

SELECT CURDATE() AS Today;

/* AGGREGATE FUNCTIONS */
SELECT COUNT(*) AS Total_Students
FROM STUDENT;

SELECT SUM(Marks) AS Total_Marks
FROM STUDENT;

SELECT AVG(Marks) AS Average_Marks
FROM STUDENT;

SELECT MAX(Marks) AS Highest_Marks
FROM STUDENT;

SELECT MIN(Marks) AS Lowest_Marks
FROM STUDENT;
