/* Exercise source: https://www.khanacademy.org/computing/hour-of-code/hour-of-code-lessons/hour-of-sql/pp/project-design-a-store-database */

CREATE TABLE bike_store (id INTEGER PRIMARY KEY, bike_name TEXT, price INTEGER, discount TEXT, free_delivery TEXT);

INSERT INTO bike_store VALUES(0, 'RockRider ST530', 2000, false, true);
INSERT INTO bike_store VALUES(1, 'RockRider ST540', 1500, false, false);
INSERT INTO bike_store VALUES(2, 'Merida', 3000, true, true);
INSERT INTO bike_store VALUES(3, 'Cannondale', 15000, false, false);
INSERT INTO bike_store VALUES(4, 'Trek', 9000, false, true);
INSERT INTO bike_store VALUES(5, 'Scott', 7500, false, true);
INSERT INTO bike_store VALUES(6, 'Giant', 20000, true, true);
INSERT INTO bike_store VALUES(7, 'Canyon', 84380, false, true);
INSERT INTO bike_store VALUES(8, 'Cube', 4900, true, true);
INSERT INTO bike_store VALUES(9, 'Specialized', 8300, false, true);
INSERT INTO bike_store VALUES(10, 'Kona', 7590, false, false);
INSERT INTO bike_store VALUES(11, 'Santa Cruz', 4500, false, false);
INSERT INTO bike_store VALUES(12, 'Shimano', 10000, false, true);
INSERT INTO bike_store VALUES(13, 'SRAM', 9500, true, true);
INSERT INTO bike_store VALUES(14, 'Velo', 2800, false, true);


SELECT * FROM bike_store;

-- Total price of all bikes
SELECT SUM(price) FROM bike_store;

-- Total price of all bikes that don't have free delivery
SELECT SUM(price), free_delivery FROM bike_store WHERE free_delivery=0;

-- Total price of all bikes based on discount (true/false)
SELECT discount, SUM(price) FROM bike_store GROUP BY discount;

-- All bikes that have a discount
SELECT bike_name, discount FROM bike_store WHERE discount=1;

-- Bikes that costs less 10000 and ordered by cheapest
SELECT bike_name, price FROM bike_store WHERE price <= 10000 ORDER BY price;

-- Get the number of bikes in the database
SELECT COUNT(bike_name) FROM bike_store;

-- ========== ChatGPT Teacher Exercises =) ==========
-- Get all bikes sorted by price in descending order
SELECT bike_name, price FROM bike_store ORDER BY price DESC;

-- All bikes with 'Rock' in the name
SELECT bike_name FROM bike_store WHERE bike_name LIKE '%Rock%';

-- Average price of all bikes in the store
SELECT AVG(price) FROM bike_store;

-- Group bikes based on the free_delivery field and find the count of bikes in each group.
SELECT COUNT(bike_name), free_delivery FROM bike_store GROUP BY free_delivery;

-- Group the bikes by the discount field and find the average price for each group.
SELECT SUM(price), discount FROM bike_store GROUP BY discount;

-- Find the highest-priced bike that offers free delivery.
SELECT bike_name, MAX(price) FROM bike_store WHERE free_delivery=1;

-- Calculate the total price of all bikes that do not have a discount.
SELECT SUM(price) FROM bike_store WHERE discount = 0;

-- Retrieve the top 5 most expensive bikes.
SELECT bike_name, price FROM bike_store ORDER BY price DESC LIMIT 5;

-- Get the 3 cheapest bikes that have free delivery.
SELECT bike_name, price FROM bike_store WHERE free_delivery = 1 ORDER BY price LIMIT 3;

-- Find bikes that are either discounted or have free delivery.
SELECT bike_name, discount, free_delivery FROM bike_store WHERE discount = 1 OR free_delivery = 1;

-- Find bikes that are not discounted and do not have free delivery.
SELECT bike_name, discount, free_delivery FROM bike_store WHERE discount = 0 AND free_delivery = 0;

-- Update the price of all bikes that are discounted by reducing them by 10%.
-- UPDATE bike_store SET price = price + 5;
UPDATE bike_store SET price = price - (price/10) WHERE discount = 1;
SELECT bike_name, price FROM bike_store WHERE discount = 1;

-- Set the free_delivery to true for all bikes priced above 8000.
UPDATE bike_store SET free_delivery = 1 WHERE price > 8000;
SELECT bike_name, price, free_delivery FROM bike_store WHERE price > 8000;

-- Delete all bikes with a price less than 3000.
DELETE FROM bike_store WHERE price < 3000;
SELECT bike_name, price FROM bike_store ORDER BY price;

-- ========== More Practice with GROUP BY ==========
-- Group bikes by free_delivery and calculate the total number of bikes in each group.
SELECT free_delivery, COUNT(bike_name) FROM bike_store GROUP BY free_delivery;

-- Group bikes by discount and find the sum of prices for each group.
SELECT SUM(price), discount FROM bike_store GROUP BY discount;

-- Group bikes by the first letter of bike_name and find the average price for each group.
SELECT SUBSTRING(bike_name, 1, 1) AS first_letter, AVG(price) FROM bike_store GROUP BY first_letter;

-- Num of bikes that starts with that first letter
SELECT SUBSTRING(bike_name, 1, 1) AS first_letter, COUNT() FROM bike_store GROUP BY first_letter;

-- Group by discount and find the maximum and minimum prices within each group
SELECT MIN(price) AS min_price, MAX(price) AS max_price, discount FROM bike_store GROUP BY discount;

-- Group bikes by discount, find the count of bikes in each group, and order the results by count in descending order.
SELECT COUNT(bike_name) AS bike_count, discount FROM bike_store GROUP BY discount ORDER BY bike_count;

-- Group bikes by free_delivery, calculate the average price, and order by the average price in ascending order.
SELECT COUNT(bike_name) AS bike_count, free_delivery, AVG(price) AS avg_price FROM bike_store GROUP BY free_delivery ORDER BY avg_price;

-- Group bikes by both discount and free_delivery, then find the average price for each combination.
SELECT COUNT(bike_name) AS bike_count, AVG(price) AS avg_price, discount, free_delivery FROM bike_store GROUP BY discount, free_delivery;

-- Group bikes by free_delivery and discount, and count how many bikes are in each group.
SELECT COUNT(bike_name) AS bike_count, free_delivery, discount FROM bike_store GROUP BY free_delivery, discount;

-- Group bikes by free_delivery, and for each group, find the count of bikes priced above 5000.
SELECT COUNT(bike_name) AS bike_count, price, free_delivery FROM bike_store WHERE price > 5000 GROUP BY free_delivery;

-- Group by discount and calculate the total number of bikes priced below 10000.
SELECT COUNT(bike_name) AS bike_count, price, discount FROM bike_store WHERE price < 10000 GROUP BY discount;

-- --> Group bikes by free_delivery and filter groups where the average price is greater than 6000.
SELECT * FROM bike_store;

SELECT COUNT(bike_name), AVG(price) AS avg_price, free_delivery FROM bike_store GROUP BY free_delivery HAVING avg_price > 6000;

-- --> Group bikes by discount and show groups where the total price of bikes is above 15000.
SELECT COUNT(bike_name), SUM(price) AS total_price, discount FROM bike_store GROUP BY discount HAVING total_price > 15000;

-- ========================================