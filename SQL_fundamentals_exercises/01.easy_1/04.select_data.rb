Write an SQL statement to query all data that is currently in our birds table.

Solution
SELECT * FROM birds;

-- or we can specify all the columns we wish to query

SELECT name, age, species FROM birds;
Discussion
To query all the data in our table, we need to use a SELECT statement. When writing our query, we may do either of two things: specify all columns in our table, or we may use the splat symbol (*).

Regardless of which method we use, we get the same result.

 id |   name   | age | species
----+----------+-----+---------
  1 | Charlie  |   3 | Finch
  2 | Allie    |   5 | Owl
  3 | Jennifer |   3 | Magpie
  4 | Jamie    |   4 | Owl
  5 | Roy      |   8 | Crow
(5 rows)
Whether you use parentheses around the columns you wish to query is important. Leave the parentheses off and we get 4 individual columns returned in a table. Include parentheses, and all our data gets grouped together into one column, like so:

==> SELECT (id,name,age,species) FROM birds;
          row
-----------------------
 (1,Charlie,3,Finch)
 (2,Allie,5,Owl)
 (3,Jennifer,3,Magpie)
 (4,Jamie,4,Owl)
 (5,Roy,8,Crow)
(5 rows)