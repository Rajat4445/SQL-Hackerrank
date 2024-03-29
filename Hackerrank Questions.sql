



-- WEATHER OBSERVATION STATION 6:

SELECT city FROM station 
WHERE city REGEXP '^[aeiou]' OR city REGEXP '^[AEIOU]'

-- Query the list of CITY names ending with vowels (a, e, i, o, u) from STATION. Your result cannot contain duplicates

SELECT city FROm station
WHERE city REGEXP '[aeiou]$'


-- Query the list of CITY names from STATION which have vowels (i.e., a, e, i, o, and u) 
-- as both their first and last characters. Your result cannot contain duplicates

SELECT DISTINCT(city) FROM station
WHERE (city REGEXP '^[aeiou]' OR city REGEXP '^[AEIOU]') AND (city REGEXP '[aeiou]$')

-- Query the list of CITY names from STATION that do not start with vowels. Your result cannot contain duplicates. (Weather Observation 9)

SELECT DISTINCT(city) FROM station
WHERE city NOT REGEXP '^[AEIOU]'

-- Query the list of CITY names from STATION that do not end with vowels. Your result cannot contain duplicates. (Waether Observation 10)

SELECT DISTINCT(city) FROM station
WHERE city NOT REGEXP '[aeiou]$'

-- Query the list of CITY names from STATION that either do not start with vowels or do not end with vowels. Your result cannot contain duplicates
-- Weather Observation 11

SELECT DISTINCT(city) FROM station 
WHERE city NOT REGEXP '^[AEIOU]' OR city NOT REGEXP '[aeiou]$'

-- Query the list of CITY names from STATION that do not start with vowels and do not end with vowels. Your result cannot contain duplicates
-- Weather Observation 12

SELECT DISTINCT(city) FROM station
WHERE city NOT REGEXP '^[AEIOU]' AND city NOT REGEXP '[aeiou]$'

-- Query the Name of any student in STUDENTS who scored higher than 75 Marks. Order your output by the last three characters of each name. 
-- If two or more students both have names ending in the same last three characters (i.e.: Bobby, Robby, etc.), secondary sort them by ascending ID

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

-- Query a count of the number of cities in CITY having a Population larger than 1,00,000

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

-- Query the average population for all cities in CITY, rounded down to the nearest integer.

SELECT ROUND(AVG(population))
FROM city

-- Query the sum of the populations for all Japanese cities in CITY. The COUNTRYCODE for Japan is JPN.

SELECT SUM(population)
FROM city
WHERE countrycode = 'JPN'

-- Query the difference between the maximum and minimum populations in CITY.

SELECT MAX(population) - MIN(population)
FROM city

-- Samantha was tasked with calculating the average monthly salaries for all employees in the EMPLOYEES table, but did not realize her keyboard's  key was broken until after completing the calculation. She wants your help finding the difference between her miscalculation (using salaries with any zeros removed), and the actual average salary.
-- Write a query calculating the amount of error (i.e.: actual - miscaluclated) average monthly salaries, and round it up to the next integer.

SELECT ROUND(AVG(salary) - AVG(REPLACE(salary, '0', ''))) + 1
FROM employees

SELECT CEIL(AVG(salary) - AVG(REPLACE(salary, '0', '')))    -- CEIL return the integer greater than or equal to the one on the output
FROM employees

-- We define an employee's total earnings to be their monthly salary x months worked, and the maximum total earnings to be the maximum total earnings for any employee in the Employee table. 
-- Write a query to find the maximum total earnings for all employees as well as the total number of employees who have maximum total earnings. Then print these values as  space-separated integers.

SELECT salary*months, COUNT(employee_id)
FROM employee
WHERE salary*months IN (SELECT MAX(salary*months) FROM employee)
GROUP BY salary*months

-- Query the following two values from the STATION table:
--The sum of all values in LAT_N rounded to a scale of 2 decimal places.
-- The sum of all values in LONG_W rounded to a scale of 2 decimal places.

SELECT ROUND(SUM(lat_n), 2), ROUND(SUM(long_w), 2)
FROM station

-- Query the sum of Northern Latitudes (LAT_N) from STATION having values greater than 38.7880 and less than 137.2345. Truncate your answer to  decimal places.

SELECT ROUND(SUM(lat_n), 4)
FROM station
WHERE lat_n BETWEEN 38.7880 AND 137.2345

-- Query the greatest value of the Northern Latitudes (LAT_N) from STATION that is less than 137.2345 . Truncate your answer to 4 decimal places.

SELECT ROUND(MAX(lat_n), 4)
FROM station
WHERE lat_n < 137.2345

-- Query the Western Longitude (LONG_W) for the largest Northern Latitude (LAT_N) in STATION that is less than 137.2345. 
-- Round your answer to 4 decimal places.


SELECT ROUND(long_w, 4)
FROM station
WHERE lat_n = (SELECT MAX(lat_n) FROM station WHERE lat_n < 137.2345)

-- Query the smallest Northern Latitude (LAT_N) from STATION that is greater than 38.7780. Round your answer to 4 decimal places.

SELECT ROUND(MIN(lat_n), 4)
FROM station
WHERE lat_n > 38.7780

-- Query the Western Longitude (LONG_W)where the smallest Northern Latitude (LAT_N) in STATION is greater than 38.7780 . Round your answer to 4 decimal places.

SELECT ROUND(long_w, 4)
FROM station
WHERE lat_n = (SELECT MIN(lat_n) FROM station WHERE lat_n > 38.7780)

-- Given the CITY and COUNTRY tables, query the sum of the populations of all cities where the CONTINENT is 'Asia'.
-- Note: CITY.CountryCode and COUNTRY.Code are matching key columns.

SELECT SUM(city.population)
FROM city
LEFT JOIN country
ON city.countrycode = country.code
WHERE continent = 'Asia'

-- Given the CITY and COUNTRY tables, query the names of all cities where the CONTINENT is 'Africa'.
-- Note: CITY.CountryCode and COUNTRY.Code are matching key columns.

SELECT city.name
FROM city
LEFT JOIN country
ON city.countrycode = country.code
WHERE continent = 'Africa'

-- Given the CITY and COUNTRY tables, query the names of all the continents (COUNTRY.Continent) and their respective average city populations (CITY.Population) rounded down to the nearest integer.
-- Note: CITY.CountryCode and COUNTRY.Code are matching key columns, there are null values in the city table

SELECT continent, Floor(AVG(city.population))
FROM country
LEFT JOIN city
On city.countrycode = country.code
WHERE city.id IS NOT NULL
GROUP BY continent 

/* (THE PADS)
Generate the following two result sets:
Query an alphabetically ordered list of all names in OCCUPATIONS, immediately followed by the first letter of each profession as a parenthetical (i.e.: enclosed in parentheses). For example: AnActorName(A), ADoctorName(D), AProfessorName(P), and ASingerName(S).
Query the number of ocurrences of each occupation in OCCUPATIONS. Sort the occurrences in ascending order, and output them in the following format: 
There are a total of [occupation_count] [occupation]s.
where [occupation_count] is the number of occurrences of an occupation in OCCUPATIONS and [occupation] is the lowercase occupation name. If more than one Occupation has the same [occupation_count], they should be ordered alphabetically
*/
SELECT CONCAT(name,'(', SUBSTRING(occupation, 1,1),')')
FROM occupations
ORDER BY name;                                                  -- There are two separate queries as you can observe
SELECT CONCAT('There are a total of ', COUNT(occupation),' ', lower(occupation),'s.')
FROM occupations
GROUP BY occupation
ORDER BY COUNT(occupation), occupation

/* (WEATHER OBSERATION STATION 18)
Consider  and  to be two points on a 2D plane.
 happens to equal the minimum value in Northern Latitude (LAT_N in STATION).
 happens to equal the minimum value in Western Longitude (LONG_W in STATION).
 happens to equal the maximum value in Northern Latitude (LAT_N in STATION).
 happens to equal the maximum value in Western Longitude (LONG_W in STATION).
Query the Manhattan Distance between points p1 and p2 and round it to a scale of 4 decimal places.    */

-- For two points A(x1, y1) and B(x2, y2), Manhattan distance is |x1-x2|+|y1-y2|  or The distance between two points measured along axes at right angles

SELECT ROUND(ABS(MIN(lat_n)-MAX(lat_n))+ABS(MIN(long_w)-MAX(long_w)),4)
FROM station

/*
Consider p1(a,c) and p2(b,d) to be two points on a 2D plane where (a,b) are the respective minimum and maximum values of Northern Latitude (LAT_N) and (c,d) are the respective minimum and maximum values of Western Longitude (LONG_W) in STATION.
Query the Euclidean Distance between points p1  and p2  and format your answer to display 4 decimal digits.
*/

SELECT ROUND(SQRT(POWER(MIN(lat_n)-MAX(lat_n), 2)+POWER(MIN(long_w)-MAX(long_w), 2)), 4)
FROM station          -- As ED -->      h^2 = p^2 + b^2


/* (THE REPORT) great question!!!!!!!!!!!!!!!!!!!!!!!!
Ketty gives Eve a task to generate a report containing three columns: Name, Grade and Mark. 
Ketty doesn't want the NAMES of those students who received a grade lower than 8. The report must be in descending order by grade -- i.e. higher grades are entered first. 
If there is more than one student with the same grade (8-10) assigned to them, order those particular students by their name alphabetically. 
Finally, if the grade is lower than 8, use "NULL" as their name and list them by their grades in descending order. 
If there is more than one student with the same grade (1-7) assigned to them, order those particular students by their marks in ascending order. */

SELECT
  CASE
    WHEN GRADES.GRADE >= 8 THEN STUDENTS.NAME
    WHEN GRADES.GRADE < 8 THEN NULL
  END AS NAME,
  GRADES.GRADE,
  STUDENTS.MARKS
FROM STUDENTS
  LEFT JOIN GRADES ON STUDENTS.MARKS >= MIN_MARK
  AND STUDENTS.MARKS <= MAX_MARK
ORDER BY
  GRADES.GRADE DESC, STUDENTS.NAME ASC, STUDENTS.MARKS ASC;
