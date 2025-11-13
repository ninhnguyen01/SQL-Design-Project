SELECT 'SQL'
AS result;

SELECT title
FROM films;

SELECT release_year 
FROM films;

SELECT name
FROM people;

SELECT title
FROM films;

SELECT title, release_year
FROM films;

SELECT title, release_year, country
FROM films;

SELECT *
FROM films;

SELECT DISTINCT country
FROM films;

SELECT DISTINCT certification
FROM films;

SELECT DISTINCT role
FROM roles;

SELECT COUNT(*)
FROM people;

SELECT COUNT(birthdate)
FROM people;

SELECT COUNT(DISTINCT birthdate)
FROM people;

SELECT COUNT (DISTINCT language)
FROM films;

SELECT COUNT(DISTINCT country)
FROM films;

SELECT *
FROM films
WHERE release_year = 2016;

SELECT COUNT (*)
FROM films
WHERE release_year < 2000;
