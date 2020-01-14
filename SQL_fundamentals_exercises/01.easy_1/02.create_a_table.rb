Now that we have an animals database, we can lay the groundwork needed to add some data to it.

Make a table called birds. It should have the following fields:

id (a primary key)
name (string with space for up to 25 characters)
age (integer)
species (a string with room for no more than 15 characters)

Solution
CREATE TABLE birds(
  id serial PRIMARY KEY,
  name character varying(25),
  age integer,
  species character varying(15)
);
Discussion
Let's start from the top. We want a primary key that auto-increments. For that last part, we'll use the pseudotype serial. It auto-increments id for us as we create new bird rows in the table. This column should be a primary key, which ensures that id is NOT NULL and UNIQUE. (There's some overlap here; serial also includes NOT NULL.)

We also want name and species columns. Those will work as text. Here, we use varchar, character varying, or text, which are all aliases, so all will work.

The age column is last; we set it as type integer.