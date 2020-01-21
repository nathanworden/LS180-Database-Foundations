## SQL

- Explain the difference between INNER, LEFT OUTER, and RIGHT OUTER joins.

  - An `INNER JOIN` returns a result set that contains the common elements of the tables, i.e. the intersection where they match on the joined condition (which means that the join table contains only rows where there is a definite match between the values in the two columns used in the condition.) `INNER JOINS` are the most frequently used `JOIN`s; if you don't specify a join type and simply use the `JOIN` keyword, then PostgreSQL will assume you want an inner join. If you want to include a row in your results despite that row not having a match in the join table, you would need to use a different type of join.
  - A `LEFT OUTER JOIN`takes all the rows from one table, defined as the `LEFT` table, and joins it with a second table. The `JOIN` is based on the conditions supplied in the parenthesis. A `LEFT JOIN` will always include the rows from the `LEFT ` table, even if there are no matching rows in the table it is JOINed with.
  - A `RIGHT JOIN` is similar to a `LEFT JOIN` except that the roles betwee the two tables are reversed, and all the rows on the second table are included along with any matching tows from the first table.

- Name and define the three sublanguages of SQL.

  - DDL - Data Definition Language - The part of the SQL language that allow a user to create and modify the schema stored within a database. It includes `CREATE TABLE` `ALTER TABLE`, `ADD COLUMN` and several other stateents for creating or modifying the structure of or rules that govern the data taht is held within the database.
  - DML - Data Manipulation Language - The part of the SQL language that allows a user to retrieve or modify the data stored within a database. Examples are `SELECT`, `INSERT`, `UPDTE`, and `DELETE`.
  - DCL - Data Control Language - The part of the SQL language that controls the rights and access roles of the users interacting with a database or table. Example `GRANT`.

- Write SQL statements using INSERT, UPDATE, DELETE, CREATE/ALTER/DROP TABLE, ADD/ALTER/DROP COLUMN.

  - `CREATE`

  ```sql
  sql_book=# CREATE TABLE users (
    id serial UNIQUE NOT NULL,
    username char(25),
    enabled boolean DEFAULT TRUE
    );
  ```

  - `ALTER TABLE`

  ```sql
  ALTER TABLE users
  RENAME TO all_users;
  ```

  - `DROP TABLE`

  ```sql
  DROP TABLE all_users;
  ```

  - `ADD COLUMN`

  ```sql
  ALTER TABLE all_users
  ADD COLUMN last_login timestamp NOT NULL DEFAULT NOW();
  ```

  - `ALTER COLUMN`

  ```sql
  ALTER TABLE all_users
  ALTER COLUMN full_name SET NOT NULL;
  ```

  - `DROP COLUMN`

  ```sql
  ALTER TABLE all_users
  DROP COLUMN enabled;
  ```

  - `INSERT`

  ```sql
  INSERT INTO users (full_name)
  VALUES ('Jane Smith'), ('Harry Potter');
  ```

  - `UPDATE`

  ```sql
  UPDATE users SET enabled = true
  WHERE full_name = 'Harry Potter' OR full_name = 'Jane Smith';
  ```

  - `DELETE`

  ```sql
  DELETE FROM users
  WHERE full_name = 'Harry Potter' AND id  3;
  ```

  

- Understand how to use GROUP BY, ORDER BY, WHERE, and HAVING.

  - `GROUP BY` - Sometimes you need to combine data results together to form more meaningful information. 

  ```sql
  SELECT enabled, count(id) FROM users GROUP BY enabled;
  ```

  (One thing to be aware of when using aggregate functions, is that if you include columns in the column list alongside the function then those columns must also be included in the `GROUP BY` clause. For example, both of the following statemenst would return an error:

  ```sql
  SELECT enabled, count(id) FROM users;
  SELECT enabled, id, count(id) FROM users GROUP BY enabled;
  ```

  - `ORDER BY`

  ```sql
  SELECT full_name, enabled FROM users
  ORDER BY enabled;
  ```

  		 -  Rather than returning only certain rows, as `WHERE` does, `ORDER BY` displays the results of a query in a particular sort order. The `ORDER BY` clause comes after we have specified the table name. If our statement includes a `WHERE` clause, the `ORDER BY` clause comes after this also.

- What is an index? - It is useful to think of indexes as a way of storing a quick-reference to values in a particular column.

## PostgreSQL

- Describe what a sequence is and what they are used for.

  - A sequence is a type of relation. (Kind of like how tables are a relation.)
  - A **sequence** is a special kind of relation that generates a series of numbers. A sequence will remember the last number it generated, so it will generate numbers in a predetermined sequence automatically.

  ```sql
  -- This statement:
  CREATE TABLE colors (id serial, name text);
  
  -- is actually interpreted as if it were this one:
  CREATE SEQUENCE colors_id_seq;
  CREATE TABLE colors (
      id integer NOT NULL DEFAULT nextval('colors_id_seq'),
      name text
  );
  ```

  - You can see from the expanded example above that the sequence's value is used as the `id` column's default value. The next value of a sequence is accessed using `nextval`, and can be done in any SQL statement:

  ```sql
  sql-course=# SELECT nextval('colors_id_seq');
   nextval
  ---------
         4
  (1 row)
  ```

  - Once a number is returned by `nextval` for a standard sequence, it will not be returned again, regardless of whether the value was stored in a row or not. If we insert another row into the **colors** table, the `id` value for that row will skip `4` and move on to the next value in the sequence:

  ```sql
  sql-course=# INSERT INTO colors (name) VALUES ('yellow');
  INSERT 0 1
  sql-course=# SELECT * FROM colors;
   id |  name
  ----+--------
    1 | red
    2 | green
    3 | blue
    5 | yellow
  (4 rows)
  ```

  

  - Sequences are used to generate unique primary keys (?)
  - Generates a series of numbers in a pre-determined order.

- Create an auto-incrementing column.

  - id serial PRIMARY KEY

  - CREATE SEQUENCE [sequence name]. When you create the table you can call the sequence using the function nextval()

  - ```sql
    ALTER TABLE films ADD COLUMN id serial PRIMARY KEY;
    ```

    - https://launchschool.com/lessons/a1779fd2/assignments/00e428da

- Define a default value for a column.

- Be able to describe what primary, foreign, natural, and surrogate keys are.

  - Primary Keys - By specifying `PRIMARY KEY` (in a similar way to how we would specify `NOT NULL`), PostgreSQL will create an index on that column that enforces it holding unique values in addition to preventing the column from holding NULL values. For the most part, the two code snippets below are the same:

  ```sql
  CREATE TABLE more_colors (id int PRIMARY KEY, name text);
  ```

  ```sql
  CREATE TABLE more_colors (id int NOT NULL UNIQUE, name text);
  ```

  - Foreign Keys

  In database parlance, a *foreign key* can refer to two different, but related, things:

  - A column that represents a relationship between two rows by pointing to a specific row in another table using its *primary key*. A complete name for these columns is *foreign key column*.
  - A constraint that enforces certain rules about what values are permitted in these foreign key relationships. A complete name for this type of constraint is *foreign key constraint*.

  Let's take a look at a simple relationship between two entities and see how each of these applies. We'll work with a database that has two entities, Product and Order:

  

  ![Products have many orders](https://da77jsbdz4r05.cloudfront.net/images/foreign_keys/products_orders_erd.png)

  You can see above that products have many orders. Once that ERD is translated into a physical schema, we might have something like this:

  

  ![Database diagram](https://da77jsbdz4r05.cloudfront.net/images/foreign_keys/products_orders_dd.png)

  

  In the above schema, the *product_id* column is a foreign key, pointing to values in the primary key column of rows in the *products* table.

  ### Creating Foreign Key Columns

  To create a foreign key *column*, just create a column of the same type as the primary key column it will point to. Since the `products` table shown above uses an `integer` type for its primary key column, `orders.product_id` is also an `integer` column.

  ### Creating Foreign Key Constraints

  To create a foreign key *constraint*, there are two syntaxes that can be used. The first is to add a `REFERENCES` clause to the description of a column in a `CREATE TABLE` statement:

  ```sql
  CREATE TABLE orders (
    id serial PRIMARY KEY,
    product_id integer REFERENCES products (id),
    quantity integer NOT NULL
  );
  ```

  The second way is to add the foreign key constraint separately, just as you would any other constraint (note the use of `FOREIGN KEY` instead of `CHECK`):

  ```sql
  ALTER TABLE orders ADD CONSTRAINT orders_product_id_fkey FOREIGN KEY (product_id) REFERENCES products(id);
  ```

  ### Referential Integrity

  One of the main benefits of using the foreign key constraints provided by a relational database is to preserve the *referential integrity* of the data in the database. The database does this by ensuring that every value in a foreign key column exists in the primary key column of the referenced table. Attempts to insert rows that violate the table's constraints will be rejected.

  - Natural Keys

  A **natural key** is an existing value in a dataset that can be used to uniquely identify each row of data in that dataset. On the surface there appear to be a lot of values that *might* be satisfactory for this use: a person's phone number, email address, social security number, or a product number.

  However, in reality most values that *seem* like they are good candidates for natural keys turn out to not be. A phone number and email address can change hands. A social security number shouldn't change but only some people have them. And products often go through multiple revisions while retaining the same product number.

  There are a variety of solutions to these problems, including using more than one existing value together as a **composite key**. But instead of solving the problems associated with natural keys, this will often just defer the problem until later without actually addressing it.

  Luckily for database users everywhere, there is another option.

  - Surrogate Keys

  A **surrogate key** is a value that is created solely for the purpose of identifying a row of data in a database table. Because it is created specifically for that purpose, it can avoid many of the problems associated with natural keys.

  Perhaps the most common surrogate key in use today is an auto-incrementing integer. This is a value that is added to each row in a table as it is created. With each row, this value increases in order to remain unique in each row.

  Let's create a table with just such a column in PostgreSQL:

  ```sql
  CREATE TABLE colors (id serial, name text);
  ```

  It's common to call the surrogate key created for a table **id** (short for *identifier*).

- Create and remove CHECK constraints from a column.

  - ```sql
    ALTER TABLE users ADD CHECK (full_name <> '');
    ```

    

- Create and remove foreign key constraints from a column.

- https://launchschool.com/lessons/5ae760fa/assignments/bb4f3ba2

- What is psql? It is a interface, its a repl. You can issue SQL queries directly from it.

- What is referential integrity? - When you have a foreign key an primary key. The referenctial integrity makes sure that the reference you are putting in actually exists in another table.

## Database Diagrams

- Define cardinality and modality.
  - Cardinality - The number of objects on each side of the relationship.
  - Modality - The modality of a relationship indicates if that relationship is required or not.
- Be able to draw database diagrams using crow's foot notation.