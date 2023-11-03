ALTER DATABASE target_database RENAME TO new_database;

ALTER DATABASE target_database OWNER TO new_owner;

ALTER DATABASE target_database SET TABLESPACE new_tablespace;

-- Change session defaults for run-time configuration variables: 
-- By, default, PostgreSQL loads the configuration variable from the postgresql.conf file.
-- It is important to note that only the superuser or the database owner can change the default session variables for a database. 
ALTER DATABASE target_database SET config_data = value;

--
CREATE DATABASE my_test_db; 
\l   -- check Name column

ALTER DATABASE my_test_db RENAME TO my_renamed_db;
\l   -- check Name column

CREATE ROLE geeks
 VALID UNTIL 'infinity';
\du   -- check 'Role name' column
ALTER DATABASE my_renamed_db OWNER TO geeks;
\l   -- check Owner column



CREATE TABLESPACE geeks_default
 OWNER geeks
 LOCATION E'C:\\pgdata\\geeks';
\db+   -- check Location column
ALTER DATABASE my_renamed_db
 SET TABLESPACE geeks_default;
\l+   -- check Tablespace column