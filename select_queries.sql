USE PersonalTrainer;

--1. Select everything form Exercise Table
SELECT * FROM Exercise;

--2. Select everything form Client Table
SELECT * FROM Client;

--3. Select all columns from Client where the City is Metairie.
SELECT *
FROM Client
WHERE City = 'Metairie';

--4. Is there a Client with the ClientId '818u7faf-7b4b-48a2-bf12-7a26c92de20c'?
SELECT *
FROM Client
WHERE ClientID = '818u7faf-7b4b-48a2-bf12-7a26c92de20c';

--5. How many rows are in the Goal table?
SELECT * FROM Goal;

--6. Select Name and LevelId from the Workout table. 
SELECT Name, LevelId FROM Workout; 

--7. Select Name, LevelId, and Notes from Workout where LevelId is 2.
SELECT Name, LevelId, Notes FROM Workout
WHERE LevelId = 2;

--8. Select FirstName, LastName, and City from Client where City is Metairie, Kenner, or Gretna.
SELECT FirstName, LastName, City
FROM Client
WHERE City IN ('Metairie', 'Kenner', 'Gretna');

--9. Select FirstName, LastName, and BirthDate from Client for Clients born in the 1980s.
SELECT FirstName, LastName, BirthDate
FROM Client
WHERE BirthDate BETWEEN '1980-01-01' AND '1989-12-31';

--10. 
SELECT FirstName, LastName, BirthDate
FROM Client
WHERE BirthDate >= '1980-01-01' AND BirthDate <= '1989-12-31';

--11.How many rows in the Login table have a .gov EmailAddress?
SELECT * FROM Login
WHERE EmailAddress LIKE '%.gov';

--12.How many Logins do NOT have a .com EmailAddress? 
SELECT * FROM Login
WHERE EmailAddress NOT LIKE '%.com';

--13. Select first and last name of Clients without a BirthDate.
SELECT FirstName, LastName, BirthDate
FROM Client
WHERE BirthDate IS NULL;

--14.Select the Name of each ExerciseCategory that has a parent (ParentCategoryId value is not null).
SELECT Name
FROM ExerciseCategory
WHERE ParentCategoryId IS NOT NULL;

--15. Select Name and Notes of each level 3 Workout that contains the word 'you' in its Notes.
SELECT Name, Notes, LevelId
FROM Workout
WHERE LevelId = 3 AND Notes LIKE '%you%';

--16.Select FirstName, LastName, City from Client whose LastName starts with L,M, or N and who live in LaPlace. 
SELECT FirstName, LastName, City
FROM Client
WHERE (LastName LIKE 'L%' OR 'M%' OR 'N%') AND City = 'LaPlace';

--17.Select InvoiceId, Description, Price, Quantity, ServiceDate and the line item total, a calculated value, from InvoiceLineItem, where the line item total is between 15 and 25 dollars.
SELECT InvoiceId, 
    Description, 
	Quantity, 
    ServiceDate,
    Price * Quantity AS LineItemTotal
FROM InvoiceLineItem
WHERE (Price * Quantity) BETWEEN 15 AND 25;

--18. Does the database include an email address for the Client, Estrella Bazely?
SELECT FirstName, LastName, ClientId
FROM Client
WHERE FirstName = 'Estrella' AND LastName = 'Bazely';

SELECT EmailAddress
FROM Login
WHERE ClientId = '87976c42-9226-4bc6-8b32-23a8cd7869a5';

--19. What are the Goals of the Workout with the Name 'This Is Parkour'?
SELECT WorkoutId
FROM Workout
WHERE Name = 'This is Parkour';

SELECT GoalId 
FROM WorkoutGoal
WHERE WorkoutId = 12;

SELECT Name
FROM Goal
WHERE GoalId IN (3, 8, 15);





