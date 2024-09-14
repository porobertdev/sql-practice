-- ========== ChatGPT PRACTICE ==========

-- customers table
CREATE TABLE customers (customer_id INTEGER PRIMARY KEY, name TEXT, country TEXT);

INSERT INTO customers (customer_id, name, country) VALUES
(1, 'John Smith', 'USA'),
(2, 'Maria Garcia', 'Spain'),
(3, 'Chen Wei', 'China'),
(4, 'Amina Khan', 'Pakistan'),
(5, 'David Brown', 'Canada'),
(6, 'Yuki Tanaka', 'Japan'),
(7, 'Michael Zhang', 'Australia'),
(8, 'Lucas Rossi', 'Brazil'),
(9, 'Robert', 'Romania'),
(19, 'Johhny Bravo', 'USA');

-- orders table
CREATE TABLE orders (order_id INTEGER PRIMARY KEY, customer_id INTEGER, product TEXT, amount INTEGER, order_date DATE, FOREIGN KEY (customer_id) REFERENCES customers(customer_id));

INSERT INTO orders (order_id, customer_id, product, amount, order_date) VALUES
(1, 1, 'Bicycle', 500, '2023-09-01'),
(2, 3, 'Helmet', 50, '2023-09-03'),
(3, 4, 'Gloves', 25, '2023-09-07'),
(4, 5, 'Bicycle', 600, '2023-09-11'),
(5, 1, 'Pedals', 75, '2023-09-12'),
(6, 2, 'Shoes', 120, '2023-09-14'),
(7, 7, 'Glasses', 80, '2023-09-15'),
(8, 6, 'Helmet', 60, '2023-09-17'),
(9, 19, 'Hair Conditioner', 20, '2024-09-14'),
(10, 20, 'Bananas', 20, '2024-09-13'),
(11, 21, 'Kiwi', 20, '2024-09-12'),
(12, 22, 'Apples', 20, '2024-09-11');

-- ========== ChatGPT EXERCISES ========== 

-- INNER JOIN: Retrieve a list of all customers and their orders. Show customer name, product, and order amount.
SELECT name, product, amount
FROM customers INNER JOIN orders
ON customers.customer_id = orders.customer_id;

-- LEFT OUTER JOIN: Get a list of all customers, including those who haven’t placed any orders. Show the customer name and product (if any).
SELECT name, product
FROM customers LEFT OUTER JOIN orders
ON customers.customer_id = orders.customer_id;

-- ??? RIGHT OUTER JOIN: List all orders along with the customer names. Include any orders even if the customer’s information isn’t available.
SELECT name, order_id
FROM customers RIGHT OUTER JOIN orders
ON orders.customer_id = customers.customer_id;

-- FULL OUTER JOIN: Retrieve a list of all customers and all orders, even if some customers haven’t placed orders or some orders don’t have a customer assigned.
SELECT name, product, order_id
FROM customers FULL OUTER JOIN orders
ON customers.customer_id = orders.customer_id;

-- Filtering with INNER JOIN: List all orders made by customers from the USA.
SELECT name, country, product
FROM customers INNER JOIN orders
ON customers.country = 'USA' AND customers.customer_id = orders.customer_id;

-- Filtering with LEFT OUTER JOIN: Show all customers, but only include their orders if the order amount is greater than 100.
SELECT name, product, amount
FROM customers LEFT OUTER JOIN orders
ON customers.customer_id = orders.customer_id AND orders.amount > 100;

-- ??? LEFT OUTER JOIN with calculations: Show all customers and their total order amounts. Include customers who haven’t placed orders (show 0 as the total).
SELECT name, SUM(amount) AS total_amount
FROM customers LEFT OUTER JOIN orders
ON customers.customer_id = orders.customer_id
GROUP BY name
ORDER BY total_amount DESC;

-- INNER JOIN with multiple conditions: List all customers who ordered either a 'Bicycle' or a 'Helmet'.
SELECT name, product
FROM customers INNER JOIN orders
ON customers.customer_id = orders.customer_id
WHERE product = 'Bicycle' OR product = 'Helmet';

-- Aggregate functions with JOIN: Show each customer's name and their total number of orders. Include customers without any orders.
SELECT name, COUNT(order_id)
FROM customers LEFT OUTER JOIN orders
ON customers.customer_id = orders.customer_id
GROUP BY name;

-- Combine INNER JOIN and ORDER BY: Retrieve a list of all customers who have placed orders, along with the total amount they have spent, ordered by the amount in descending order.
SELECT name, SUM(amount) AS total_amount
FROM customers INNER JOIN orders
ON customers.customer_id = orders.customer_id
GROUP BY name
ORDER BY total_amount DESC;

-- RIGHT OUTER JOIN with DISTINCT: Show all orders and distinct customer names. Include all orders even if the customer name is unknown.
SELECT DISTINCT name, order_id
FROM customers RIGHT OUTER JOIN orders
ON customers.customer_id = orders.customer_id;

-- ???===== LEFT OUTER JOIN to identify non-ordering customers: Get a list of all customers who haven’t placed any orders.
SELECT name, product
FROM customers LEFT OUTER JOIN orders
ON customers.customer_id = orders.customer_id
WHERE orders.order_id is NULL;


-- ??==== RIGHT OUTER JOIN to identify unassigned orders: List all orders that don’t have a matching customer (this would normally occur if foreign key relationships are missing or invalid).
SELECT order_id
FROM customers RIGHT OUTER JOIN orders
ON customers.customer_id = orders.customer_id
WHERE name is NULL;
--