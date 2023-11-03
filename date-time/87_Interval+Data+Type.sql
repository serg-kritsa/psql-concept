ALTER TABLE test_time
ADD COLUMN span interval;

DELETE  FROM test_time;

--Postgres Format
INSERT INTO test_time (span)
VALUES ('5 DECADES 3 YEARS, 6 MONTHS 3 DAYS');
INSERT INTO test_time (span)
VALUES ('5 DECADES 3 YEARS, 6 MONTHS 3 DAYS ago');

SELECT * FROM test_time;

--SQL Standard
INSERT INTO test_time (span)
VALUES ('4 32:12:10');

INSERT INTO test_time (span)
VALUES ('1-2');


--ISO 8061 Format
INSERT INTO test_time (span)
VALUES (‘P5Y3MT7H3M’)

INSERT INTO test_time (span)
VALUES ('P25-2-30T17:33:10');

SHOW intervalstyle;
SELECT * FROM test_time;

SET intervalstyle='postgres_verbose';
SELECT * FROM test_time;

SET intervalstyle='sql_standard';
SELECT * FROM test_time;

SET intervalstyle='iso_8601';
SELECT * FROM test_time;

SET intervalstyle='postgres';
