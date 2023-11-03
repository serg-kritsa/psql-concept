SELECT * FROM pg_timezone_names;

SELECT * FROM  pg_timezone_abbrevs;

ALTER TABLE test_time
ADD COLUMN endstamp TIMESTAMP WITH TIME ZONE;

ALTER TABLE test_time
ADD COLUMN endtime TIME WITH TIME ZONE;


INSERT INTO test_time
(endstamp,endtime)
VALUES ('01/20/2018 10:30:00 US/Pacific', '10:30:00+5');
INSERT INTO test_time (endstamp,endtime)
VALUES ('06/20/2018 10:30:00 US/Pacific', '10:30:00+5');

//Notice the difference in offset due to daylight savings time
SELECT * FROM test_time;


SHOW TIME ZONE;
//notice the offset of time
SELECT * FROM test_time;

SET TIME ZONE 'US/Pacific'

//notice offset changed
SELECT * FROM test_time;
