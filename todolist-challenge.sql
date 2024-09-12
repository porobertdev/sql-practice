/* Exercise Source: https://www.khanacademy.org/computing/hour-of-code/hour-of-code-lessons/hour-of-sql/pc/challenge-todo-list-database-stats */

CREATE TABLE todo_list (id INTEGER PRIMARY KEY, item TEXT, minutes INTEGER);
INSERT INTO todo_list VALUES (1, 'Wash the dishes', 15);
INSERT INTO todo_list VALUES (2, 'vacuuming', 20);
INSERT INTO todo_list VALUES (3, 'Learn some stuff on KA', 30);
INSERT INTO todo_list VALUES(4, 'Cooking', 60);

SELECT * from todo_list;

-- Get the sum of all minutes
SELECT SUM(minutes) FROM todo_list;