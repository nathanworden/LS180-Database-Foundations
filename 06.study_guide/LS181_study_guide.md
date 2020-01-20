## SQL

- Explain the difference between INNER, LEFT OUTER, and RIGHT OUTER joins.
  - An `INNER JOIN` returns a result set that contains the common elements of the tables, i.e. the intersection where they match on the joined condition (which means that the join table contains only rows where there is a definite match between the values in the two columns used in the condition.) `INNER JOINS` are the most frequently used `JOIN`s; if you don't specify a join type and simply use the `JOIN` keyword, then PostgreSQL will assume you want an inner join. If you want to include a row in your results despite that row not having a match in the join table, you would need to use a different type of join.
  - A `LEFT OUTER JOIN`takes all the rows from one table, deifed as the `LEFT` table, and joins it with a second table. The `JOIN` is based on the conditions supplied in the parenthesis. A `LEFT JOIN` will always include the rows from the `LEFT ` table, even if there are no matching rows in the table it is JOINed with.
  - A `RIGHT JOIN` is similar to a `LEFT JOIN` except that the roles betwee the two tables are reversed, and all the rows on the second table are included along with any matching tows from the first table.
- Name and define the three sublanguages of SQL.
  - DDL - Data Definition Language - The part of the SQL language that allow a user to create and modify the schema stored within a database. It includes `CREATE TABLE` `ALTER TABLE`, `ADD COLUMN` and several other stateents for creating or modifying the structure of or rules that govern the data taht is held within the database.
  - DML - Data Manipulation Language - The part of the SQL language that allows a user to retrieve or modify the data stored within a database. Examples are `SELECT`, `INSERT`, `UPDTE`, and `DELETE`.
  - DCL - Data Control Language - The part of the SQL language that controls the rights and access roles of the users interacting with a database or table. Example `GRANT`.
- Write SQL statements using INSERT, UPDATE, DELETE, CREATE/ALTER/DROP TABLE, ADD/ALTER/DROP COLUMN.
  - 
- Understand how to use GROUP BY, ORDER BY, WHERE, and HAVING.

## PostgreSQL

- Describe what a sequence is and what they are used for.
  - A sequence is a type of relation. (Kind of like how tables are a relation.)
- Create an auto-incrementing column.
- Define a default value for a column.
- Be able to describe what primary, foreign, natural, and surrogate keys are.
- Create and remove CHECK constraints from a column.
- Create and remove foreign key constraints from a column.
- What is psql? It is a interface, its a repl. You can issue SQL queries directly from it.
- What is referential integreet? - When you have a foreign key an primary key. The referenctial integrity makes sure that the reference you are putting in actually exists in another table.

## Database Diagrams

- Define cardinality and modality.
- Be able to draw database diagrams using crow's foot notation.