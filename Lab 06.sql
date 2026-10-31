--Lab 06
--Implement SQL Operators: Demonstrate the use of different types of operators in SQL with examples Special Operators, and Set Operations(UNION)
SELECT 'Special SQL Operators' AS Operations;
SELECT * FROM Product;

SELECT ProductName, Price
FROM Product
WHERE Price BETWEEN 1000 AND 30000;

SELECT ProductName, Price
FROM Product
WHERE ProductName IN ('Laptop', 'Mobile');

SELECT ProductName, Price
FROM Product
WHERE ProductName LIKE 'M%';

SELECT ProductName, Price, Discount
FROM Product
WHERE Discount IS NULL;
 










 
CREATE TABLE BCA_Students (
    Student_ID INT,
    Name VARCHAR(50),
    Marks INT
);
INSERT INTO BCA_Students VALUES
(101, 'Rahul', 85),
(102, 'Anu', 72),
(103, 'Kiran', 90),
(104, 'Priya', 65);
CREATE TABLE BBA_Students (
    Student_ID INT,
    Name VARCHAR(50),
    Marks INT
);
INSERT INTO BBA_Students VALUES
(105, 'Arun', 78),
(106, 'Sneha', 88),
(107, 'Rahul', 85),
(108, 'Vikas', 70);
SELECT * FROM BCA_Students;
SELECT * FROM BBA_Students;

 
 

/* UNOIN */
SELECT Student_ID, Name, Marks
FROM BCA_Students
UNION
SELECT Student_ID, Name, Marks
FROM BBA_Students;


/* UNION ALL */
SELECT Student_ID, Name, Marks
FROM BCA_Students
UNION ALL
SELECT Student_ID, Name, Marks
FROM BBA_Students;






 
 



