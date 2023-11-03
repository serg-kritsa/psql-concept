CREATE EXTENSION pg_trgm;

CREATE INDEX trgm_idx_performance_test_location
ON performance_test USING gin (location gin_trgm_ops);

CREATE INDEX idx_performance_test_name
ON performance_test (name);


-- terrible performance
EXPLAIN ANALYZE SELECT location
FROM  performance_test
WHERE name LIKE '%dfe%';

--only situation where pattern matching works
EXPLAIN ANALYZE SELECT location
FROM  performance_test
WHERE name LIKE 'dfe%';


-- much better performance
EXPLAIN ANALYZE SELECT location
FROM  performance_test
WHERE location LIKE '%dfe%';

EXPLAIN ANALYZE SELECT location
FROM  performance_test
WHERE location LIKE 'dfe%';
