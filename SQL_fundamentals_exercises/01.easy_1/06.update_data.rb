It seems there was a mistake when we were inserting data in the birds table. One of the rows has a species of 'Crow', but that bird is actually a Raven. Update the birds table so that a row with a species of 'Crow' now reads 'Raven'.




Solution
UPDATE birds SET species = 'Raven'
  WHERE species = 'Crow';
Discussion
To update a row of data, we have to use the SQL statement UPDATE. Here is the general form of this statement:

UPDATE table_name
  SET { column_name = colvalue, ... } [, ...]
  WHERE conditions;
We may SET one or more column values with the UPDATE statement. We don't need to specify column names that we don't need to update. The WHERE clause specifies the rows that need to be updated.

This is what we do in our solution above. We update the table birds, setting species equal to "Raven" wherever species currently equals "Crow". Here is the result:

id |   name   | age | species
---+----------+-----+---------
 1 | Charlie  |   3 | Finch
 2 | Allie    |   5 | Owl
 3 | Jennifer |   3 | Magpie
 4 | Jamie    |   4 | Owl
 5 | Roy      |   8 | Raven
(5 rows)
Further Exploration
Oops. Jamie isn't an Owl - he's a Hawk. Correct his information.