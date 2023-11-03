SELECT DATE '2018-09-28' + INTERVAL '5 days 1 hour';

SELECT TIME '5:30:10' + INTERVAL '70 minutes 80 seconds';

SELECT TIMESTAMP '1917-06-20 12:30:10.222' +
  INTERVAL '30 years 6 months 7 days 3 hours 17 minutes 3 seconds';

SELECT INTERVAL '5 hours 30 minutes 2 seconds' +
      INTERVAL '5 days 3 hours 13 minutes';

SELECT DATE '2017-04-05' +  INTEGER '7';

-- subtracting intervals from date,time, timestamp
SELECT DATE '2018-10-20' - INTERVAL '2 months 5 days';

SELECT TIME '23:39:17' - INTERVAL '12 hours 7 minutes 3 seconds'

SELECT TIMESTAMP '2016-12-30' - INTERVAL '27 years 3 months 17 days 3 hours 37 minutes';

-- subtracting integer from date
SELECT DATE '2016-12-30' - INTEGER '300';

--subtracting 2 dates
SELECT DATE '2016-12-30' - DATE '2009-04-7';

-- subtracting 2 times and 2 timestamps
SELECT TIME '17:54:01' - TIME '03:23:45';

SELECT TIMESTAMP '2001-02-15 12:00:00' - TIMESTAMP '1655-08-30 21:33:05';

--Multiply and divide intervals
SELECT 5 * INTERVAL '7 hours 5 minutes';

SELECT INTERVAL '30 days 20 minutes' / 2;

SELECT age(TIMESTAMP '2025-10-03', TIMESTAMP '1999-10-03');
SELECT age (TIMESTAMP '1969-04-20');
