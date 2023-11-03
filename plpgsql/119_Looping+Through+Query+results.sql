-- https://www.postgresql.org/docs/current/plpgsql-control-structures.html#PLPGSQL-RECORDS-ITERATING

-- get the data for this from the CTE - Common Table Expressions section
-- under Creating Hierarchical Data to Use for Recursive WITH Queries

-- FOR entity IN select query LOOP
-- statements...
-- END LOOP;


-- example 1
CREATE OR REPLACE FUNCTION average_of_square() RETURNS double precision AS $$
DECLARE
	square_total double precision := 0;
	total_count int := 0;
	product record;
BEGIN
	FOR product IN SELECT * FROM products LOOP
		total_count := total_count + 1;
		square_total := square_total + (product.unitprice*product.unitprice);
	END LOOP;
	RETURN square_total / total_count;
END;
$$ LANGUAGE plpgsql;

SELECT average_of_square();

-- example 2
-- https://www.postgresql.org/docs/current/queries-with.html
-- WITH RECURSIVE t(n) AS (
--     VALUES (1)
--   UNION ALL
--     SELECT n+1 FROM t WHERE n < 100
-- )
-- SELECT sum(n) FROM t; -- 5,050
CREATE FUNCTION reports_to(IN eid smallint, OUT employeeid smallint, OUT reportsto smallint) 
RETURNS SETOF record AS $$
	WITH RECURSIVE reports_to(employeeid,reportsto) AS (
		SELECT employeeid,reportsto 
		FROM employees
		WHERE employeeid = eid
		UNION ALL
		-- some processing here
		SELECT manager.employeeid,manager.reportsto
		FROM employees AS manager
		JOIN reports_to ON reports_to.reportsto = manager.employeeid
	)
	SELECT * FROM reports_to;
$$ LANGUAGE SQL;

-- -- SELECT reports_to(218::smallint);
-- employeeid | reports_to
-- 218				4
-- 4				2
-- 2				200
-- 200				null

CREATE OR REPLACE FUNCTION report_to_array(eid smallint) RETURNS smallint[] AS $$
	DECLARE
		report_array smallint[];
		manager record;
	BEGIN
		FOR manager IN 
			SELECT reportsto FROM reports_to(eid) 
		LOOP
			report_array :=  array_append(report_array, manager.reportsto);
		END LOOP;

		RETURN report_array;
	END;
$$ LANGUAGE plpgsql;

SELECT report_to_array(218::smallint);
-- report_to_array
-- {4,2,200,NULL}

SELECT firstname,lastname,employeeid,report_to_array(employeeid)
FROM employees;

