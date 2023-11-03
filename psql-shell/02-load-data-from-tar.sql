CREATE DATABASE dvdrental;

-- Navigate to the bin folder of the PostgreSQL installation folder
pg_restore -U postgres -d dvdrental C:\users\sample_datbase\dvdrental.tar

-- to verify tables
\c dvdrental
\dt   -- list all the tables in the database

