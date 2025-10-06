SELECT *
FROM fake_apps;

SELECT COUNT(*)
FROM fake_apps
WHERE price = 0.0;

SELECT SUM(downloads)
FROM fake_apps;

SELECT MAX(price)
FROM fake_apps;

SELECT AVG(PRICE)
FROM fake_apps;

SELECT ROUND(AVG(price),2)
FROM fake_apps;

SELECT category, SUM(downloads)
FROM fake_apps
GROUP BY category;

SELECT category, price, AVG(downloads)
FROM fake_apps
GROUP BY 1,2;

SELECT price, ROUND(AVG(downloads)), COUNT(*)
FROM fake_apps
GROUP BY price
HAVING COUNT(*) > 10;

