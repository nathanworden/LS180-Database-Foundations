For this exercise, we'll add some data to our birds table. Add five records to this database so that our data looks like:

 id |   name   | age | species
----+----------+-----+---------
  1 | Charlie  |   3 | Finch
  2 | Allie    |   5 | Owl
  3 | Jennifer |   3 | Magpie
  4 | Jamie    |   4 | Owl
  5 | Roy      |   8 | Crow
(5 rows)




Solution
INSERT INTO birds (name, age, species) VALUES ('Charlie', 3, 'Finch');
INSERT INTO birds (name, age, species) VALUES ('Allie', 5, 'Owl');
INSERT INTO birds (name, age, species) VALUES ('Jennifer', 3, 'Magpie');
INSERT INTO birds (name, age, species) VALUES ('Jamie', 4, 'Owl');
INSERT INTO birds (name, age, species) VALUES ('Roy', 8, 'Crow');
Discussion
To add data to our birds table, we need to use the INSERT INTO SQL statement. Its general form is:

INSERT INTO table_name [ (column_name [, ...]) ] VALUES (value [, ...])
We specify a table, the column names we wish to deal with and the values we wish to insert under each of those column. Order is important here; when listing the VALUES, make sure the order of those values corresponds to the order of the column names.

To be clear, we're using PostgreSQL documentation syntax here.
"(column_name [, ...])" means that we can have one or more columns delimited by commas. The parentheses are required.

Further Exploration
There is a form of INSERT INTO that doesn't require the column names. How does that form of INSERT INTO work, and when would you use it?