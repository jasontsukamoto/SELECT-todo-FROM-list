--delete a user named michael if it exists
DROP USER michael;

--create a user named michael with an encrypted password stonebreaker
CREATE USER MICHAEL WITH ENCRYPTED PASSWORD 'stonebreaker';

--drop a database named todo_app
DROP DATABASE todo_app;

--create database named todo_app
CREATE DATABASE todo_app;

-- connect to the newly created database
\c todo_app;

-- create a table named tasks
CREATE TABLE tasks
(
  id serial,
  title varchar(225) NOT NULL,
  description text NULL,
  created_at timestamp without time zone NOT NULL DEFAULT NOW(),
  updated_at timestamp without time zone NULL,
  completed boolean NOT NULL DEFAULT FALSE,
  PRIMARY KEY(id)
)

--remove column named completed
ALTER TABLE tasks
  DROP COLUMN completed;

-- add a column to tasks named 'completed_at:timestamp' may be null, default value of null
ALTER TABLE tasks
  ADD COLUMN completed_at timestamp NULL DEFAULT NULL;

-- change the updated_at column to not allow NULL values an have a default value of now()
ALTER TABLE tasks
  ALTER COLUMN updated_at SET NOT NULL;
ALTER TABLE tasks
  ALTER COLUMN updated_at SET DEFAULT NOW();

-- create a new task by only setting values (dont set columns)
INSERT INTO tasks VALUES (1, 'Study SQL', 'Complete this exercise', NOW(), NOW(), NULL);

-- create a new task
INSERT INTO tasks (title, description)
  VALUES ('Study PostgreSQL', 'Read all the documentation');

-- select all the titles of tasks that are not yet complete
SELECT title
FROM tasks
WHERE completed_at is NULL;

-- update the task with title 'Study SQL' to be completed as of now
UPDATE tasks SET completed_at = NOW()
WHERE title = 'Study SQL';

-- select all titles and descriptions of tasks that are not yet complete
SELECT title, description
FROM tasks
WHERE completed_at is NULL;

-- select all fields of every task sorted by creation date in descending order
SELECT *
FROM tasks
ORDER BY created_at ASC;

-- create a new task
INSERT INTO tasks (title, description)
  VALUES ('mistake 1', 'a test entry');

-- create a new task
INSERT INTO tasks (title, description)
  VALUES ('mistake 2', 'another test entry');

-- create a new task
INSERT INTO tasks (title, description)
  VALUES ('third mistake', 'another test entry');

-- select title fields of all tasks with a title that includes the word mistake
SELECT title
FROM tasks
WHERE title LIKE '%mistake%';

-- delete the task that has a title of mistake 1
DELETE FROM tasks
WHERE title = 'mistake 1';

-- select title and description fields of all tasks with a title that includes the word mistake
SELECT title, description
FROM tasks
WHERE title LIKE '%mistake%';

-- delete all tasks that includes the word 'mistake' in the title
DELETE FROM tasks
WHERE title LIKE '%mistake%';

-- select all fields of all tasks sorted by title in ascending order
SELECT *
FROM tasks
ORDER BY title ASC;