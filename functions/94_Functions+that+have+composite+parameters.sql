-- example 1
-- 									01 accept single row of table
CREATE OR REPLACE FUNCTION new_price(products, increase_percent numeric)
RETURNS double precision AS $$
-- 			02 use $1 to accept single row
	SELECT $1.unitprice * increase_percent/100
$$ LANGUAGE SQL;

-- 										03 pass single row of table
SELECT productname,unitprice,new_price(products.*,110)
FROM products;

-- example 2
CREATE OR REPLACE FUNCTION full_name(employees) RETURNS varchar(62) AS $$
	SELECT $1.title || ' ' || $1.firstname || ' ' || $1.lastname
$$ LANGUAGE SQL;

SELECT full_name(employees.*),city,country
FROM employees;

-- if needed
DROP FUNCTION public.new_price(products, numeric);