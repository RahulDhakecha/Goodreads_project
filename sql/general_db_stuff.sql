## list all tables in particular databse
SELECT * FROM INFORMATION_SCHEMA.TABLES;
# above command gives us information about all the tables present in the databse, their creation time, modification time, etc

## general information about table
desc table_name;

## general information about index
sp_Helpindex table_name;