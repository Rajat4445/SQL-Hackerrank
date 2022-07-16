



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







