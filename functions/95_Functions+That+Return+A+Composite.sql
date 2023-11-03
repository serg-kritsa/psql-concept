-- example 1
CREATE OR REPLACE FUNCTION newest_hire() 
RETURNS employees AS $$
	SELECT *
	FROM employees
	ORDER BY hiredate DESC
	LIMIT 1;
$$ LANGUAGE SQL;

SELECT newest_hire(); -- everything. way 1 as composite
SELECT (newest_hire()).*; -- everything. way 2 as reguar select statement
SELECT (newest_hire()).lastname; -- field notaion
SELECT lastname(newest_hire()); -- functional notation

-- example 2
CREATE OR REPLACE FUNCTION highest_inventory() 
RETURNS products AS $$
	SELECT * FROM products
	ORDER BY (unitprice*unitsinstock) DESC
	LIMIT 1;

$$ LANGUAGE SQL;

SELECT (highest_inventory()).productname;
SELECT productname(highest_inventory());
