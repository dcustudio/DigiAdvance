-- Alice is trying to list all the details of the students who participate in her research. She could write a simple SQL statement that will give her the list of students in a table.

SELECT *  
FROM STUDENT;


-- Similarly, she wants to see all the details in the TRANSPORT table.
SELECT * 
FROM TRANSPORT;

-- Write the sql statement that shows all the details of the hasJOURNEY table
-- Answer: 
SELECT * 
FROM hasJOURNEY;

-- Alice wants to see the details of students who are 1st-year students. Show me all 1st-year students (year =1)

SELECT * 
FROM STUDENT 
WHERE year = 1;

SELECT *  
FROM TRANSPORT
WHERE EnergySource = 'Solar';


-- Write an SQL statement that shows all the details of the hasJOURNEY that are “Round” trips

-- Answer: 
SELECT * 
FROM hasJOURNEY 
WHERE trip = 'Round';


-- Alice is interested in the first and last names of students. Show me all the FirstName and LastName of students.

SELECT firstName, LastName
FROM Student;


-- Alice is asked to present what journey students took without additional details. Show the JourneyId, StudentCode and TransportCode of single trip journeys

SELECT JourneyId, StudentCode, TransportCode
FROM hasJOURNEY
WHERE trip = 'single';

-- Show all the studentCode and dates of the JOURNEYs that students make a trip greater than 10km.

-- Answer: 
SELECT studentCode, date 
FROM hasJOURNEY 
WHERE distance > 10;


-- Alice is asked to display the student list in ascending order by the last name. Show me all the FirstName and LastName of students order by LastName in ascending order.

SELECT firstName,LastName
FROM Student
ORDER BY LastName ASC;

-- Alice wants to show the order of the journey by studentCode, which effectively aggregates trips of a student together. Show the JourneyId, StudentCode and TransportCode where the trip is “single” order by the StudentCode in a descending order

SELECT JourneyId, StudentCode, TransportCode
FROM hasJOURNEY
WHERE trip = 'single'
ORDER BY StudentCode DESC;


-- Alice wants to see how much distance in total the students travelled. Show me the sum of distance students travels so far
SELECT SUM(distance)
FROM hasJOURNEY;


-- Show me the average distance the students travelled so far.
SELECT Avg(distance)
FROM hasJOURNEY;



-- Show me the Count of first-year students
SELECT count(*)
FROM STUDENT
WHERE Year = 1;

-- Show me the maximum distance travelled
SELECT Max(Distance)
FROM hasJOURNEY;

-- Show  the count of Business School students (their department code is D3)
-- Answer:

SELECT count(*)
FROM STUDENT
WHERE DepartmentCode = 'D3';


-- Show the minimum distance travelled per journey. 
-- Answer:
SELECT Min(Distance)
FROM hasJOURNEY;


-- Alice wants to see how much distance each student travelled so far. Show me the sum of distance each student travels so far
SELECT StudentCode, SUM(distance)
FROM hasJOURNEY
GROUP BY studentCode;

-- Show me the average distance each student travelled so far.

SELECT studentCode, Avg(distance)
FROM hasJOURNEY
GROUP BY studentCode;


-- Alice wants to know the number of students by year. Show me the number of students from each year.
SELECT Year, count(studentCode) as 'Number of students'
FROM STUDENT
GROUP BY YEAR;

-- Show me the number of departments that have students less than 20
SELECT DepartmentCode, count(DepartmentCode) as 'Number of students'
FROM STUDENT
GROUP BY DepartmentCode
HAVING count(DepartmentCode) < 20;


-- Show me students with their journeys

SELECT s.*, j.*
FROM STUDENT s INNER JOIN hasJOURNEY j 
ON s.StudentCode= j.StudentCode;

-- Show me transport details of each journey.
SELECT t.*, j.*
FROM TRANSPORT t INNER JOIN hasJOURNEY j
ON t.TransportCode= j.TransportCode;

-- Show me the details of students, their journey and the transport they used.
SELECT s.*, j.*, t.*
FROM STUDENT s INNER JOIN hasJOURNEY j 
ON s.StudentCode= j.StudentCode INNER JOIN TRANSPORT t
ON t.TransportCode= j.TransportCode;

-- Now let’s add one more new student using the default INSERT Syntax.

INSERT INTO STUDENT 
VALUES  (11, 'Tina', 'Turner', 'Dublin', 'Dublin', 2, 'D4');


-- Delete the student with student code 11

DELETE FROM Student
WHERE StudentCode = 11;


--  Write an SQL statement that shows the average emission of a student for each transport type.
-- Answer:

SELECT s.*, j.*, t.*
FROM STUDENT s INNER JOIN hasJOURNEY j 
ON s.StudentCode= j.StudentCode INNER JOIN TRANSPORT t
ON t.TransportCode= j.TransportCode;

