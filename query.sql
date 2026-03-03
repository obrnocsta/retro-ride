-- SELECT all
SELECT * FROM cars;

-- Selecting columns
SELECT brand, model, condition, year FROM cars;

-- WEHERE clause
SELECT brand, model, condition, price FROM cars
WHERE condition = 0;

-- Numerical filtering
SELECT brand, model, condition, price FROM cars
WHERE price < 50000;

-- Not equal
SELECT brand, model, price, color FROM cars
WHERE color != 'yellow';

-- NOT and LIKE
SELECT brand, model, color, year FROM cars
WHERE model LIKE 'DB_';

-- AND
SELECT brand, model, year, condition, price FROM cars
WHERE condition >= 3
AND year < 1970
AND price <= 100000;

-- BETWEEN
SELECT brand, model, condition, color, price FROM cars
WHERE price BETWEEN 20000 AND 60000
AND condition BETWEEN 1 AND 3
AND color LIKE '%red%';

-- OR
SELECT brand, model, color, year, price, sold FROM cars
WHERE (color LIKE '%red%'
OR year BETWEEN 1960 AND 1969)
AND sold IS FALSE;

-- IN 
SELECT brand, model, price, sold FROM cars
WHERE (brand NOT IN ('Ford', 'Triumph', 'Chevrolet', 'Dodge') OR price < 50000)
AND sold IS FALSE;

-- ORDER BY
SELECT brand, model, condition, price FROM cars
WHERE sold IS FALSE
AND condition != 5
ORDER BY condition DESC, price;

-- LIMIT
SELECT brand, model, color, price FROM cars
WHERE color LIKE '%red%'
AND sold IS FALSE
ORDER BY price
LIMIT 5;

-- COUNT and SUM
SELECT SUM(price) AS total_earnings FROM cars
WHERE sold IS TRUE;

-- MAX, MIN, AVG
SELECT CEIL(AVG(price)) AS avg, MIN(price), MAX(price) FROM cars
WHERE sold IS TRUE;

-- GROUP BY
SELECT brand, count(brand), FLOOR(AVG(price)) AS AVG FROM cars
WHERE sold IS FALSE
GROUP BY brand;

-- HAVING
SELECT year, count(year) AS car_count, MAX(price), MIN(price) FROM cars
WHERE sold IS TRUE
GROUP BY year
HAVING count(year) > 1
ORDER BY car_count;

-- INSERT INTO
INSERT INTO cars 
	(brand, model, year, price, color, condition, sold) 
VALUES 
	('Chevrolet', 'Bel Air', 1955, 50000, 'purple', 5, FALSE),
	('Porsche', '944 Turbo', 1986, 48000, 'white', 4, FALSE);

-- UPDATE
UPDATE cars 
SET	condition = 1, price = 10000
WHERE brand = 'Porsche'
AND sold IS FALSE;

-- DELETE
DELETE FROM cars
WHERE sold IS TRUE;
