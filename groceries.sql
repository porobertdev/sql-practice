/** Grocery list: 
Bananas (4)
Peanut Butter (1)
Dark Chocolate Bars (2)
**/

CREATE TABLE groceries (id INTEGER PRIMARY KEY, name TEXT, quantity INTEGER);

INSERT INTO groceries VALUES (1, 'Bananas', 4);
INSERT INTO groceries VALUES (2, 'Peanut Butter', 1);
INSERT INTO groceries VALUES (3, 'Dark Chocolate Bars', 2);

-- Print the whole table
SELECT * FROM groceries;

-- Print only the product names
SELECT name FROM groceries;
