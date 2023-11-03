CREATE DATABASE test_db;

\connect postgres;

-- to check all active connections to the “test_db” database: 
SELECT
    *
FROM
    pg_stat_activity
WHERE
    datname = 'test_db';


-- to terminate all the connections to the test_db database
SELECT
    pg_terminate_backend (pid)
FROM
    pg_stat_activity
WHERE
    datname = 'test_db';

-- after closing connections it's possible to rename target db
ALTER DATABASE test_db RENAME TO new_test_db;
\l    -- SELECT datname FROM pg_database; -- way 2