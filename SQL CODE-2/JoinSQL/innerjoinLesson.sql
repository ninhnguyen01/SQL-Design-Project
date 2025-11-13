-- Select all columns from cities
SELECT *
FROM cities
___

SELECT * 
FROM cities
  -- Inner join to countries
  INNER JOIN countries
    -- Match on the country codes
    ON cities.country_code = countries.code;

    -- Select name fields (with alias) and region 
SELECT cities.name AS city, countries.name AS country, region 
FROM cities
  INNER JOIN countries
    ON cities.country_code = countries.code;

    -- Select fields with aliases
SELECT c.code AS country_code, name, year, inflation_rate
FROM countries AS c
  -- Join to economies (alias e)
  INNER JOIN economies AS e
    -- Match on code
    ON c.code = e.code;

    -- Select fields
SELECT code, name, region, year, fertility_rate
  -- From countries (alias as c)
  FROM countries AS c 
  -- Join with populations (as p)
  INNER JOIN populations AS p
    -- Match on country code
    ON c.code = p.country_code 

 -- Select fields
SELECT c.name AS country, continent, l.name AS language, official
  -- From countries (alias as c)
  FROM countries AS c 
  -- Join to languages (as l)
  INNER JOIN languages AS l 
    -- Match using code
    ON c.code = l.code 
    
       