When we initially created our birds table, we forgot to take into account a key factor: preventing certain values from being entered into the database. For instance, we would never find a bird that is negative n years old. We could have included a constraint to ensure that bad data isn't entered for a database record, but we forgot to do so.

For this exercise, write some code that ensures that only birds with a positive age may be added to the database. Then write and execute an SQL statement to check that this new constraint works correctly.


Approach/Algorithm
You will need to use the ALTER TABLE statement to complete this exercise.

Solution
ALTER TABLE birds ADD CONSTRAINT check_age CHECK (age > 0);

INSERT INTO birds (age, name, species) VALUES (-2, 'Alan', 'Blue Jay');

ERROR:  new row for relation "birds" violates check constraint "check_age"
DETAIL:  Failing row contains (9, Alan, -2, Blue Jay).
Discussion
If we follow the "Approach/Algorithm" section, we know to start with ALTER TABLE. After checking out the ALTER TABLE documentation, we'll notice that there are examples of how to add a constraint. We first specify ALTER TABLE followed by the table we wish to alter. Then, we specify an ADD CONSTRAINT clause, with a name of check_age (the name is your choice) and an associated boolean expression as specified by the CHECK clause.

This leads us to our solution:

ALTER TABLE birds ADD CONSTRAINT check_age CHECK (age > 0);
There is also a shorthand for these types of CHECK constraints; if we don't mind having a constraint name generated for us, we can write:

ALTER TABLE birds ADD CHECK (age > 0);
instead.

Finally, we make sure that our new constraint is working by attempting to add a new record with a negative age. It does indeed work, as we can see from the following code.

INSERT INTO birds (age, name, species) VALUES (-2, 'Alan', 'Blue Jay');

ERROR:  new row for relation "birds" violates check constraint "check_age"
DETAIL:  Failing row contains (9, Alan, -2, Blue Jay).