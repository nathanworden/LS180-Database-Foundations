Drop Table
It seems we are done with our birds table, and no longer have a need for it in our animals database. Write an SQL statement that will drop the birds table and all its data from the animals database.

Hide Solution & Discussion
Solution
DROP TABLE birds;
Discussion
To accomplish this, we don't need to do much: the convenient SQL DROP TABLE statement provides the functionality we need. Its simplest form is DROP TABLE table_name. We may even check for this table's existence before dropping it to avoid an error. To do that we write:

DROP TABLE IF EXISTS birds;
We can specify multiple tables as well. For instance, if there was also a reptiles table that we wanted to delete, we might write SQL like:

DROP TABLE birds, reptiles;