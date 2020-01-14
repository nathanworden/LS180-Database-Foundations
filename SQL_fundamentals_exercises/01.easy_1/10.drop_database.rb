Drop Database
Let's finish things up by dropping the database animals. With no tables in it, we don't have much use for it any more. Write a SQL statement or PostgreSQL command to drop the animals database.

Hide Solution & Discussion
Solution
DROP DATABASE animals;
OR

$ dropdb animals
Discussion
There are two ways to go about this. We may explicitly write out the SQL for dropping this database with the SQL statement DROP DATABASE db_name. Note, that you will have to use the SQL statement below from another database other than animals. You cannot drop a database while you're still connected to it.

This situation is very similar to that of creating a database, as there is a wrapper function for dropping a database.

Just as there is

$ createdb db_name
wrapper function for creating a database, there is also a wrapper function for dropping a database:

$ dropdb db_name
Either one should work, but do keep in mind that dropdb is exclusive to PostgreSQL and is used from a basic Terminal console, not from inside the psql console.