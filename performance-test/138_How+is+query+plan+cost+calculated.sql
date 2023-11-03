SET max_parallel_workers_per_gather = 0;
EXPLAIN SELECT * FROM performance_test
WHERE location like 'ab%';

-- size of table
SELECT pg_relation_size('performance_test'),
  pg_size_pretty(pg_relation_size('performance_test'));


-- number of relation pages
SELECT relpages
FROM pg_class
WHERE relname='performance_test';

--
SELECT relpages, pg_relation_size('performance_test') / 8192
FROM pg_class
WHERE relname='performance_test';

-- I/O cost per relationship page read
SHOW seq_page_cost;

-- total I/O cost
SELECT relpages * current_setting('seq_page_cost')::numeric
FROM pg_class
WHERE relname='performance_test';

-- number of rows
SELECT reltuples
FROM pg_class
WHERE relname='performance_test';

--CPU cost per row processed
SHOW cpu_tuple_cost;
SHOW cpu_operator_cost;

-- Total CPU Costs
SELECT reltuples * current_setting('cpu_tuple_cost')::numeric +
reltuples * current_setting('cpu_operator_cost')::numeric
FROM pg_class
WHERE relname='performance_test';

-- Total Costs for a table scan
SELECT relpages * current_setting('seq_page_cost')::numeric +
reltuples * current_setting('cpu_tuple_cost')::numeric +
reltuples * current_setting('cpu_operator_cost')::numeric
FROM pg_class
WHERE relname='performance_test';

SHOW parallel_setup_cost;
SHOW parallel_tuple_cost;

SET max_parallel_workers_per_gather = 4;
EXPLAIN (ANALYZE, VERBOSE) SELECT * FROM performance_test
WHERE location like 'ab%';
