Create a new database called animals.

we use the wrapper function for CREATE DATABASE, createdb.

$ createdb animals
We may also use an SQL statement.

CREATE DATABASE animals;
Discussion
For this exercise, we need to create a new database. With PostgreSQL, the easiest way to do that is to use the Postgres wrapper function, createdb. But, if we want to stick with standard SQL, then we can use the CREATE DATABASE SQL command. Remember: to use CREATE DATABASE (and other SQL), you must use the psql console; to use createdb (and other wrapper functions) , you must use the regular terminal console.