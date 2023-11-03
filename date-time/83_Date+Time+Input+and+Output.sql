SHOW DateStyle;

SET DateStyle = 'ISO,DMY';

SET DateStyle = 'ISO,MDY'


CREATE TABLE test_time (
	startdate DATE,
	startstamp TIMESTAMP,
	starttime TIME
);

Insert INTO test_time (startdate, startstamp,starttime)
VALUES ('epoch'::abstime,'infinity'::abstime,'allballs');


SELECT * FROM test_time;

Insert INTO test_time (startdate, startstamp)
VALUES ('NOW'::abstime,'today'::abstime);


SELECT * FROM test_time;
