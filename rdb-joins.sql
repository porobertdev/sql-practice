CREATE TABLE users (user_id INTEGER PRIMARY KEY, username TEXT, email TEXT);
CREATE TABLE posts (post_id INTEGER PRIMARY KEY, post TEXT, date TEXT);

-- USERS
INSERT INTO users VALUES(0, 'porobertdev', 'porobertdev@gmail.com');
INSERT INTO users VALUES(1, 'magician', 'magician@gmail.com');
INSERT INTO users VALUES(2, 'john', 'john@gmail.com');
INSERT INTO users VALUES(3, 'Mr. Cat', NULL);

-- POSTS
INSERT INTO posts VALUES(0, 'Programming is cool bro', '14 Sep 2024');
INSERT INTO posts VALUES(1, 'Today I started the #100DaysOfCode Challenge with The Odin Project :)', 'April 2023');
INSERT INTO posts VALUES(10, 'This post is really stupid', '10 August 2033');
INSERT INTO posts VALUES(3, 'This is the fourth post added into the database', '4 July 2020');


-- JOINS

SELECT * FROM users;
SELECT * FROM posts;

-- INNER JOIN => select all records from both tables that match up
SELECT post_id, username, post
FROM users INNER JOIN posts
ON users.user_id = posts.post_id;

-- LEFT OUTER JOIN => select all records from LEFT table, and add records from RIGHT table that match up
SELECT post_id, email
FROM users LEFT OUTER JOIN posts
ON users.user_id = posts.post_id;

-- RIGHT OUTER JOIN => same, but the opposite: selects all from RIGHT + adds matching records from LEFT
SELECT post_id, email
FROM users RIGHT OUTER JOIN posts
ON users.user_id = posts.post_id;

-- FULL OUTER JOIN => select all rows (records) from both tables, but puts NULL where values don't match up;
SELECT *
FROM users FULL OUTER JOIN posts
ON users.user_id = posts.post_id;