-- https://www.postgresql.org/docs/9.5/sql-explain.html
-- https://www.postgresql.org/docs/current/sql-analyze.html

DROP TABLE IF EXISTS performance_test;
CREATE TABLE performance_test (
  id serial,
  location text
);
INSERT INTO performance_test (location)
SELECT md5(random()::text) FROM generate_series(1,10000000);


-- it thinks there will be rows=50000
EXPLAIN ANALYZE SELECT * FROM performance_test
WHERE id = 2000000;

ANALYZE performance_test;

-- it now thinks there will be rows=1
EXPLAIN ANALYZE SELECT * FROM performance_test
WHERE id = 2000000;
