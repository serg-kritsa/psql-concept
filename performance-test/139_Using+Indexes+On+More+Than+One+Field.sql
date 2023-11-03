ALTER TABLE performance_test
ADD COLUMN name text;

UPDATE performance_test
SET name = md5(location);

-- takes above 900ms after data cached
EXPLAIN ANALYZE SELECT *
FROM  performance_test
WHERE location LIKE 'df%' AND name LIKE 'cf%';

CREATE INDEX idx_peformance_test_location_name
ON performance_test(location,name);
-- -- index naming convention (table_column_idx) 
-- -- will be used by default 
-- CREATE INDEX ON performance_test(location,name);  
-- DROP INDEX idx_name; -- not have to remember that bacause of naming convention 
-- 
-- SELECT pg_size_pretty(pg_relation_size('<idx-name>'));        size of idx on HDD
-- NOTE: primary key and unique fields already has indices
-- SELECT relname, relkind FROM pg_class WHERE relkind = 'i';    print all indices
-- 

-- takes 55 ms
EXPLAIN ANALYZE SELECT *
FROM  performance_test
WHERE location LIKE 'df%' AND name LIKE 'cf%';

-- this can't use index
EXPLAIN ANALYZE SELECT *
FROM  performance_test
WHERE  name LIKE 'cf%';

-- this can
EXPLAIN ANALYZE SELECT *
FROM  performance_test
WHERE location LIKE 'df%';
