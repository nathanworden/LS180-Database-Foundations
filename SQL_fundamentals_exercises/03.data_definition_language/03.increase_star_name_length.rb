Increase Star Name Length
Hmm... it turns out that 25 characters isn't enough room to store a star's complete name. For instance, the star "Epsilon Trianguli Australis A" requires 30 characters. Modify the column so that it allows star names as long as 50 characters.

Hide Solution & Discussion
Solution
ALTER TABLE stars
ALTER COLUMN name TYPE varchar(50);
Discussion
There are at least 3 data types we can use to modify the name column:

We can use char(50): this defines the column as always having values with 50-character strings. If you assign a short name to such a column, PostgreSQL will expand it to 50 characters by appending an appropriate number of spaces.

We can use varchar(50): a varchar column differs from a char column in that varchar isn't a fixed size. You can store anything from an empty string to a string with the maximum number of characters for the field. Unlike the char type, PostgreSQL will not add spaces to pad a varchar value.

We can use text: a text column allows a string of any length.

For this exercise, we will exclude text since it doesn't limit the number of characters as required, and we will exclude char(50) since char(50) is always 50 characters in length. Instead, we will use varchar(50) since it uses less space to store names that are shorter than 50 characters.

As for our solution, the main item of note here is that the keyword TYPE is required in order to change the data type associated with a column.

Further Exploration
Assume the stars table already contains one or more rows of data. What will happen when you try to run the above command? To test this, revert the modification and add a row or two of data:

ALTER TABLE stars
ALTER COLUMN name TYPE varchar(25);

INSERT INTO stars (name, distance, spectral_type, companions)
           VALUES ('Alpha Centauri B', 4, 'K', 3);

ALTER TABLE stars
ALTER COLUMN name TYPE varchar(50);