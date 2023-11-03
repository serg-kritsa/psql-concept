DROP TABLE IF EXISTS performance_test;

CREATE TABLE performance_test (
  id serial,
  location text
);


INSERT INTO performance_test (location)
SELECT md5(random()::text) FROM generate_series(1,10000000); -- 10 million

-- this takes forever 332
SELECT COUNT(*) FROM performance_test;
-- -- 2nd and more faster because from memory 

-- this takes 331 msec
SELECT * FROM performance_test
WHERE id = 2000000;

-- notice that it does a sequential scan
EXPLAIN SELECT COUNT(*) FROM performance_test;

EXPLAIN SELECT * FROM performance_test
WHERE id = 2000000;


CREATE INDEX idx_performance_test_id ON performance_test (id);

-- now will use an index scan
EXPLAIN SELECT * FROM performance_test
WHERE id = 2000000;

-- now count runs in 26 msec
SELECT * FROM performance_test
WHERE id = 2000000;

-- still does sequence scan
EXPLAIN SELECT COUNT(*) FROM performance_test;

-- still takes 319 msec
SELECT COUNT(*) FROM performance_test;
