/* 
SOURCE: w3schools - https://www.w3schools.com/sql/sql_groupby.asp#:~:text=BY%20column_name(s)%3B-,Demo%20Database,-Below%20is%20a
*/

CREATE TABLE customers (customerID INTEGER PRIMARY KEY, CustomerName TEXT, ContactName TEXT, Address TEXT, City TEXT, PostalCode INTEGER, Country TEXT);

INSERT INTO customers VALUES (1, 'Alfreds Futterkiste', 'Maria Anders', 'Obere Str. 57', 'Berlin', 12209, 'Germany');
INSERT INTO customers VALUES (2, 'Ana Trujillo Emparedados y helados', 'Ana Trujillo', 'Avda. de la Constitución 2222', 'México D.F.', 05021, 'Mexico');
INSERT INTO customers VALUES(3, 'Antonio Moreno Taqueria', 'Antonio Moreno', 'Mataderos 2312', 'México D.F.', 05023, 'Mexico');
INSERT INTO customers VALUES(4, 'Around the Horn', 'Thomas Hardy', '120 Hanover Sq.', 'London', 'WA1 1DP', 'UK');
INSERT INTO customers VALUES(5, 'Berglunds snabbköp', 'Christina Berglund', 'Berguvsvägen 8', 'Luleå', 'S-958 22', 'Sweden');

SELECT * FROM customers;

-- Order by name
SELECT ContactName from customers ORDER BY ContactName;

-- Filter
SELECT CustomerName from customers WHERE Country='Mexico';

-- Aggregate (Math) Function + Grouping
-- get the number of customers in each country
SELECT COUNT(CustomerName), Country FROM customers GROUP BY Country;