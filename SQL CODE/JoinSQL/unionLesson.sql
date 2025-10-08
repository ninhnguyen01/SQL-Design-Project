-- Select fields from 2010 table
SELECT *
  -- From 2010 table
  FROM economies2010 
	-- Set theory clause
	UNION
-- Select fields from 2015 table
SELECT *
  -- From 2015 table
  FROM economies2015
-- Order by code and year
ORDER BY code, year;

-- Select field
SELECT country_code
  -- From cities
  FROM cities
	-- Set theory clause
	UNION
-- Select field
SELECT code 
  -- From currencies
  FROM currencies
-- Order by country_code
ORDER BY country_code;

-- Select fields
SELECT code, year
  -- From economies
  FROM economies
	-- Set theory clause
	UNION ALL
-- Select fields
SELECT country_code, year 
  -- From populations
  FROM populations 
-- Order by code, year
ORDER BY code, year;

-- Select fields
SELECT code, year
  -- From economies
  FROM economies
	-- Set theory clause
	INTERSECT
-- Select fields
SELECT country_code, year 
  -- From populations
  FROM populations
-- Order by code and year
ORDER BY code, year;

-- Select fields
SELECT country_code, name
  -- From countries
  FROM cities
	-- Set theory clause
	INTERSECT
-- Select fields
SELECT code, name
  -- From cities
  FROM countries;

  -- Select field
SELECT name
  -- From cities
  FROM cities
	-- Set theory clause
	EXCEPT
-- Select field
SELECT capital
  -- From countries
  FROM countries 
-- Order by result
ORDER BY name;

-- Select field
SELECT capital
  -- From countries
  FROM countries
	-- Set theory clause
	EXCEPT 
-- Select field
SELECT name
  -- From cities
  FROM cities
-- Order by ascending capital
ORDER BY capital;

-- Select code
SELECT code
  -- From countries
  FROM countries
-- Where region is Middle East
WHERE region = 'Middle East';

-- Query from step 1:
/*
SELECT code
  FROM countries
WHERE region = 'Middle East';
*/

-- Select field
SELECT DISTINCT name 
  -- From languages
  FROM languages
-- Order by name
ORDER BY name;

-- Query from step 2
SELECT DISTINCT name
  FROM languages
-- Where in statement
WHERE code IN 
  -- Query from step 1
  -- Subquery
  (SELECT code
   FROM countries
   WHERE region = 'Middle East')
-- Order by name
ORDER BY name;

-- Select statement
SELECT COUNT(*)
  -- From countries
  FROM countries
-- Where continent is Oceania
WHERE continent = 'Oceania';

-- Select fields (with aliases)
SELECT c1.code, c1.name, basic_unit AS currency
  -- From countries (alias as c1)
  FROM countries AS c1
  	-- Join with currencies (alias as c2)
  	INNER JOIN currencies AS c2 
    -- Match on code
    ON c1.code = c2.code 
-- Where continent is Oceania
WHERE continent = 'Oceania';

-- Select fields
SELECT name, code 
  -- From Countries
  FROM Countries
  -- Where continent is Oceania
  WHERE continent = 'Oceania'
  	-- And code not in
  	AND code NOT IN 
  	-- Subquery
  	(SELECT code
  	 FROM currencies);

-- Select the city name
SELECT name
  -- Alias the table where city name resides
  FROM cities AS c1
  -- Choose only records matching the result of multiple set theory clauses
  WHERE country_code IN
(
    -- Select appropriate field from economies AS e
    SELECT e.code 
    FROM economies AS e
    
    -- Get all additional (unique) values of the field from currencies AS c2  
    UNION  
    SELECT c2.code 
    FROM currencies AS c2 
    -- Exclude those appearing in populations AS p
    EXCEPT 
    SELECT p.country_code
    FROM populations AS p 
);

