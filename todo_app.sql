-- CREATE TABLE "users" (id serial, name text);
-- INSERT INTO "users" (name) VALUES ('Nao');
-- SELECT * FROM "users";
-- DROP TABLE "users";

DROP USER "michael";
CREATE USER "michael" PASSWORD 'abc123';
DROP DATABASE IF EXISTS "todo_app";
CREATE DATABASE "todo_app";

\c todo_app;

CREATE TABLE "tasks" (
  id serial NOT NULL, 
  title varchar(255) NOT NULL, 
  description text, 
  created_at timestamp WITHOUT TIME ZONE NOT NULL DEFAULT now(), 
  updated_at timestamp WITHOUT TIME ZONE, 
  completed boolean NOT NULL DEFAULT FALSE
);

\d+ "tasks"

-- changing the id column to the primary key
ALTER TABLE "tasks"
  ADD PRIMARY KEY (id);

-- removing the column named completed
ALTER TABLE "tasks"
  DROP COLUMN "completed";

-- add a column to tasks named completed_at:timestamp, that may be NULL, and has a default value of NULL.
ALTER TABLE "tasks"
  ADD COLUMN "completed_at" timestamp WITHOUT TIME ZONE DEFAULT NULL;

-- change the updated_at column to not allow NULL values, and have a default value of now()
ALTER TABLE "tasks"
  ALTER COLUMN "updated_at" SET NOT NULL;

ALTER TABLE "tasks"
  ALTER COLUMN "updated_at" SET DEFAULT now();

-- create a new task, by only setting values (not defining which columns) id = default value
-- title = 'Study SQL'
-- description = 'Complete this exercise'
-- created_at = now()
-- updated_at = now()
-- completed_at = NULL

INSERT INTO "tasks"
VALUES(
  default,
  'STUDY SQL',
  'Complete this exercise',
  now(),
  now(),
  NULL
);

-- create a new task
-- title = 'Study PostgreSQL'
-- description = 'Read all the documentation'
  
INSERT INTO "tasks" (
  "title",
  "description"
)
VALUES (
  'Study postgreSQL',
  'Read all teh documentation'
);

-- select all the titles of tasks that are not yet completed

SELECT "title" FROM "tasks" WHERE "completed_at" IS NULL;


-- update the task with a title of 'Study SQL' to be completed as of now

UPDATE "tasks" SET "completed_at" = now() WHERE "title" = 'STUDY SQL';

-- select all titles and descriptions of tasks that are not yet completed

SELECT "title", "description" FROM "tasks" WHERE "completed_at" IS NULL;

-- select all fields of every task sorted by creation date in descending order

SELECT * FROM "tasks" order by "created_at" DESC;

-- create a new task
-- title = 'mistake 1'
-- description = 'a test entry'

INSERT INTO "tasks" (
  "title",
  "description"
)
VALUES (
  'mistake 1',
  'a test entry'
);

-- create a new task
-- title = 'mistake 2'
-- description = 'another test entry'

INSERT INTO "tasks" (
  "title",
  "description"
)
VALUES (
  'mistake 2',
  'another test entry'
);

-- create a new task
-- title = 'third mistake'
-- description = 'another test entry'

INSERT INTO "tasks" (
  "title",
  "description"
)
VALUES (
  'third mistake',
  'another test entry'
);

-- select title fields of all tasks with a title that includes the word 'mistake'

SELECT * FROM "tasks" WHERE "title" LIKE '%mistake%';

-- delete the task that has a title of mistake 1

DELETE FROM "tasks" WHERE "title" = 'mistake 1';

-- select title and description fields of all tasks with a title that includes the word 'mistake'

SELECT "title", "description" FROM "tasks" WHERE "title" LIKE '%mistake%';

-- delete all tasks that includes the word 'mistake' in the title

DELETE FROM "tasks" WHERE "title" LIKE '%mistake%';

-- select all fields of all tasks sorted by title in ascending order

SELECT * FROM "tasks" order by "title";



SELECT * FROM "tasks";  

\d+ "tasks";

DROP TABLE "tasks";