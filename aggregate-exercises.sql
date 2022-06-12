use PersonalTrainer;

-- Use an aggregate to count the number of Clients.
-- 500 rows
SELECT
    COUNT(*) TotalNumberOfClients
FROM Client;

--------------------

-- Use an aggregate to count Client.BirthDate.
-- The number is different than total Clients. Why?
-- 463 rows
SELECT
    COUNT(BirthDate)
FROM Client;
    

--------------------

-- Group Clients by City and count them.
-- Order by the number of Clients desc.
-- 20 rows
SELECT
    City AS 'City Name',
    COUNT(*) AS 'Number of Clients'
FROM Client 
GROUP BY City
ORDER BY COUNT(*) DESC;
--------------------

-- Calculate a total per invoice using only the InvoiceLineItem table.
-- Group by InvoiceId.
-- You'll need an expression for the line item total: Price * Quantity.
-- Aggregate per group using SUM().
-- 1000 rows
SELECT
    InvoiceId,
    SUM(Price * Quantity) Total   
FROM InvoiceLineItem
GROUP BY InvoiceId;
--------------------

-- Calculate a total per invoice using only the InvoiceLineItem table.
-- (See above.)
-- Only include totals greater than $500.00.
-- Order from lowest total to highest.
-- 234 rows
SELECT
    InvoiceId,
    SUM(Price * Quantity) Total   
FROM InvoiceLineItem
GROUP BY InvoiceId
HAVING SUM(Price * Quantity) >= 500.00000000
ORDER BY SUM(Price * Quantity) ASC;
--------------------

-- Calculate the average line item total
-- grouped by InvoiceLineItem.Description.
-- 3 rows
SELECT
    Description,
    AVG(Price * Quantity) AvgTotal  
    
FROM InvoiceLineItem
GROUP BY InvoiceLineItem.Description;

--------------------

-- Select ClientId, FirstName, and LastName from Client
-- for clients who have *paid* over $1000 total.
-- Paid is Invoice.InvoiceStatus = 2.
-- Order by LastName, then FirstName.
-- 146 rows
SELECT
    c.ClientId,
    c.FirstName,
    c.LastName,
    SUM(ili.Price * ili.Quantity) Total
FROM Client c
INNER JOIN Invoice i ON c.ClientId = i.ClientId
INNER JOIN InvoiceLineItem ili ON ili.InvoiceId = i.InvoiceId
WHERE i.InvoiceStatus = 2
GROUP BY c.ClientId, c.FirstName, c.LastName
HAVING SUM(ili.Price * ili.Quantity) > 1000.0
ORDER BY c.LastName, c.FirstName;
--------------------

-- Count exercises by category.
-- Group by ExerciseCategory.Name.
-- Order by exercise count descending.
-- 13 rows
SELECT
    ec.Name CategoryName,
    COUNT(e.ExerciseCategoryId) Exercises
FROM ExerciseCategory ec
INNER JOIN Exercise e ON ec.ExerciseCategoryId = e.ExerciseCategoryId
GROUP BY ec.Name
ORDER BY COUNT(e.ExerciseCategoryId) DESC;
--------------------

-- Select Exercise.Name along with the minimum, maximum,
-- and average ExerciseInstance.Sets.
-- Order by Exercise.Name.
-- 64 rows
SELECT
    Exercise.Name,
    MIN(ExerciseInstance.Sets) MimimumEx, 
    MAX(ExerciseInstance.Sets) MaximumEx,
    AVG(ExerciseInstance.Sets) ExerciseSets
FROM Exercise 
INNER JOIN  ExerciseInstance ON ExerciseInstance.ExerciseId = Exercise.ExerciseId
GROUP BY Exercise.Name, Exercise.ExerciseId
ORDER BY Exercise.Name;

--------------------

-- Find the minimum and maximum Client.BirthDate
-- per Workout.
-- 26 rows
-- Sample: 
-- WorkoutName, EarliestBirthDate, LatestBirthDate
-- '3, 2, 1... Yoga!', '1928-04-28', '1993-02-07'
--------------------

-- Count client goals.
-- Be careful not to exclude rows for clients without goals.
-- 500 rows total
-- 50 rows with no goals
--------------------

-- Select Exercise.Name, Unit.Name, 
-- and minimum and maximum ExerciseInstanceUnitValue.Value
-- for all exercises with a configured ExerciseInstanceUnitValue.
-- Order by Exercise.Name, then Unit.Name.
-- 82 rows
--------------------

-- Modify the query above to include ExerciseCategory.Name.
-- Order by ExerciseCategory.Name, then Exercise.Name, then Unit.Name.
-- 82 rows
--------------------

-- Select the minimum and maximum age in years for
-- each Level.
-- To calculate age in years, use the MySQL function DATEDIFF.
-- 4 rows
--------------------

-- Stretch Goal!
-- Count logins by email extension (.com, .net, .org, etc...).
-- Research SQL functions to isolate a very specific part of a string value.
-- 27 rows (27 unique email extensions)
--------------------

-- Stretch Goal!
-- Match client goals to workout goals.
-- Select Client FirstName and LastName and Workout.Name for
-- all workouts that match at least 2 of a client's goals.
-- Order by the client's last name, then first name.
-- 139 rows
--------------------