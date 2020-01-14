Write an SQL statement that deletes the record that describes a 3 year-old finch.

Solution
DELETE FROM birds WHERE age=3 AND species='Finch';
Discussion
To complete this exercise we use a DELETE statement. To delete a row from birds we must specify the table we wish to delete from, and we must specify some conditions that match just the rows we wish to delete. If we leave out the WHERE clause, then all rows in table birds will be deleted.

The exercise asks us to delete the record that describes a 3 year-old finch: that is, the species is 'Finch' and the age is 3. We use these two conditions in our WHERE clause. This differentiates between any other rows that may share some data with the one we wish to delete. To include more than one condition in a WHERE clause, recall that we may use: AND, OR.