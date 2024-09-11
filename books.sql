/* 
What are your favorite books? You can make a database table to store them in! In this first step, create a table to store your list of books. It should have columns for id, name, and rating.
*/

CREATE TABLE books (id INTEGER PRIMARY KEY, name TEXT, rating INTEGER);

INSERT INTO books VALUES (1, 'Atomic Habits', 5);
INSERT INTO books VALUES (2, 'The Lean Startup', 5);
INSERT INTO books VALUES (3, 'From Zero to One', 5);

SELECT name, rating FROM books;