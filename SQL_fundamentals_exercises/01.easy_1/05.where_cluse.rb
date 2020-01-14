In this exercise, let's practice filtering the data we want to query. Using a WHERE clause, SELECT records for birds under the age of 5.

Solution
SELECT * FROM birds WHERE age < 5;
Discussion
If we use the correct WHERE clause, we should get the following data back from our query.

 id |   name   | age | species
----+----------+-----+---------
  1 | Charlie  |   3 | Finch
  3 | Jennifer |   3 | Magpie
  4 | Jamie    |   4 | Owl
(3 rows)
There are two birds that have an age 5 or above. So, we'll end up getting back three records. We may use all sorts of boolean conditions with WHERE.

For more information on WHERE, refer to this chapter of our SQL book. For more information on what operators may be used in a WHERE clause, you may refer to this chapter.