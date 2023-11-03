-- CREATE DATABASE db_name
--  OWNER =  role_name
--  TEMPLATE = template
--  ENCODING = encoding
--  LC_COLLATE = collate
--  LC_CTYPE = ctype
--  TABLESPACE = tablespace_name
-- --  CONNECTION LIMIT = max_concurrent_connection

-- db_name: It is the name of the new database that you want to create.It must always be a unique name.
-- role_name: It is the role name of the user who will own the new database.
-- template: It is the name of the database template from which the new database gets created.
-- encoding: It specifies the character set encoding for the new database. By default, it is the encoding of the template database.
-- collate: It specifies a collation for the new database.
-- ctype: It specifies the character classification for the new database like digit, lower and upper.
-- tablespace_name: It specifies the tablespace name for the new database.
-- max_concurrent_connection: It specifies the maximum concurrent connections to the new database.

-- Example 1:
CREATE DATABASE my_test_db1;
\l   -- check Name column

-- Example 2:
CREATE DATABASE my_test_db2
 WITH ENCODING='UTF8'
 OWNER=GeeksForGeeks
 CONNECTION LIMIT=30;
\l   -- check Name column