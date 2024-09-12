/** Grocery list: 
Bananas (4)
Peanut Butter (1)
Dark Chocolate Bars (2)
**/

CREATE TABLE groceries (id INTEGER PRIMARY KEY, name TEXT, quantity INTEGER, aisle INTEGER);

INSERT INTO groceries VALUES (1, 'Bananas', 4, 7);
INSERT INTO groceries VALUES(2, 'Peanut Butter', 1, 2);
INSERT INTO groceries VALUES(3, 'Dark Chocolate Bars', 2, 2);
INSERT INTO groceries VALUES(4, 'Ice cream', 1, 12);
INSERT INTO groceries VALUES(5, 'Cherries', 6, 2);
INSERT INTO groceries VALUES(6, 'Chocolate syrup', 1, 4);

-- Print the whole table
SELECT * FROM groceries;

-- Print only the product names
SELECT name FROM groceries;

-- Filter and Order results
SELECT * FROM groceries WHERE aisle < 8 ORDER BY aisle;

-- Aggregate aka Math Functions
SELECT SUM(quantity) FROM groceries;
-- get the most bought item
SELECT MAX(quantity) FROM groceries;