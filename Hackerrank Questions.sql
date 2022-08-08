



-- WEATHER OBSERVATION STATION 6:

SELECT city FROM station 
WHERE city REGEXP '^[aeiou]' OR city REGEXP '^[AEIOU]'

-- Query the list of CITY names ending with vowels (a, e, i, o, u) from STATION. Your result cannot contain duplicates.

SELECT city FROm station
WHERE city REGEXP '[aeiou]$'


-- Query the list of CITY names from STATION which have vowels (i.e., a, e, i, o, and u) 
-- as both their first and last characters. Your result cannot contain duplicates.

SELECT DISTINCT(city) FROM station
WHERE (city REGEXP '^[aeiou]' OR city REGEXP '^[AEIOU]') AND (city REGEXP '[aeiou]$')

-- Query the list of CITY names from STATION that do not start with vowels. Your result cannot contain duplicates. (Weather Observation 9)

SELECT DISTINCT(city) FROM station
WHERE city NOT REGEXP '^[AEIOU]'

-- Query the list of CITY names from STATION that do not end with vowels. Your result cannot contain duplicates. (Waether Observation 10)

SELECT DISTINCT(city) FROM station
WHERE city NOT REGEXP '[aeiou]$'

-- Query the list of CITY names from STATION that either do not start with vowels or do not end with vowels. Your result cannot contain duplicates.
-- Weather Observation 11

SELECT DISTINCT(city) FROM station 
WHERE city NOT REGEXP '^[AEIOU]' OR city NOT REGEXP '[aeiou]$'

-- Query the list of CITY names from STATION that do not start with vowels and do not end with vowels. Your result cannot contain duplicates.
-- Weather Observation 12

SELECT DISTINCT(city) FROM station
WHERE city NOT REGEXP '^[AEIOU]' AND city NOT REGEXP '[aeiou]$'

-- Query the Name of any student in STUDENTS who scored higher than 75 Marks. Order your output by the last three characters of each name. 
-- If two or more students both have names ending in the same last three characters (i.e.: Bobby, Robby, etc.), secondary sort them by ascending ID.

SELECT name FROM students 
WHERE marks > 75
ORDER BY RIGHT(name, 3), ID ASC

-- Write a query that prints a list of employee names (i.e.: the name attribute) from the Employee table in alphabetical order.
-- Employee Name

SELECT name FROM employee
ORDER BY name

-- Write a query that prints a list of employee names (i.e.: the name attribute) for employees in Employee having a salary greater than $2000 per month who have been employees for less than 10  months.
-- Sort your result by ascending employee_id.

SELECT name FROM employee
WHERE salary > 2000 AND months < 10
ORDER BY employee_id


-- Write a query identifying the type of each record in the TRIANGLES table using its three side lengths. Output one of the following statements for each record in the table:
-- Equilateral: It's a triangle with  sides of equal length.
-- Isosceles: It's a triangle with  sides of equal length.
-- Scalene: It's a triangle with  sides of differing lengths.
-- Not A Triangle: The given values of A, B, and C don't form a triangle.

SELECT
CASE 
WHEN A + B <= C OR A + C <= B OR B + C <= A THEN 'Not A Triangle'
WHEN A = B AND B = C THEN 'Equilateral'
WHEN A = B OR A = C OR B = C THEN 'Isosceles'
WHEN A <> B <> C THEN 'Scalene'
END 

FROM triangles 

-- Query a count of the number of cities in CITY having a Population larger than 1,00,000.

SELECT COUNT(name) FROM city
WHERE population > 100000

-- Query the total population of all cities in CITY where District is California.

SELECT SUM(population)
FROM city
WHERE district = 'California'

-- Query the average population of all cities in CITY where District is California.

SELECT AVG(population)
FROM city
WHERE district = 'California'






