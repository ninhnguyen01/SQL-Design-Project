SELECT name AS country, code, region, basic_unit
-- From countries
FROM countries
  -- Join to currencies
  FULL JOIN currencies
    -- Match on code
    USING (code) 
-- Where region is North America or null
WHERE region = 'North America' OR region IS NULL
-- Order by region
ORDER BY region;

SELECT countries.name, code, languages.name AS language
-- From languages
FROM languages
  -- Join to countries
  FULL JOIN countries
    -- Match on code
    USING (code)
-- Where countries.name starts with V or is null
WHERE countries.name LIKE 'V%' OR countries.name IS null 
-- Order by ascending countries.name
ORDER BY countries.name; 

-- Select fields (with aliases)
SELECT c1.name AS country, region, l.name AS language,
       basic_unit, frac_unit
-- From countries (alias as c1)
FROM countries AS c1 
  -- Join with languages (alias as l)
  FULL JOIN languages AS l 
    -- Match on code
    USING (code)
  -- Join with currencies (alias as c2)
  FULL JOIN currencies AS c2
    -- Match on code
    USING (code)
-- Where region like Melanesia and Micronesia
WHERE region LIKE 'M%esia';

-- Select fields
SELECT c.name AS city, l.name AS language
-- From cities (alias as c)
FROM cities AS c        
  -- Join to languages (alias as l)
  CROSS JOIN languages AS l 
-- Where c.name like Hyderabad
WHERE c.name LIKE 'Hyder%';

-- Select fields
SELECT c.name AS city, l.name AS language
-- From cities (alias as c)
FROM cities AS c  
  -- Join to languages (alias as l)
  INNER JOIN languages AS l 
    -- Match on country code
    ON c.country_code = l.code 
-- Where c.name like Hyderabad
WHERE c.name LIKE 'Hyder%';

-- Select fields
SELECT c.name AS country, region, life_expectancy AS life_exp 
-- From countries (alias as c)
FROM countries AS c 
  -- Join to populations (alias as p)
  LEFT JOIN populations AS p 
    -- Match on country code
    ON c.code = p.country_code 
-- Focus on 2010
WHERE year = 2010
-- Order by life_exp
ORDER BY life_expectancy
-- Limit to 5 records
LIMIT 5;

