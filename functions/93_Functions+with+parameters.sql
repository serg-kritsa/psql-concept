-- basic syntax
CREATE OR REPLACE FUNCTION function_name(param_name bpchar) 
RETURNS double precision AS $$
	SELECT COUNT(*) 
	FROM order_details
	WHERE id=param_name
$$ LANGUAGE SQL;

-- example 1
CREATE OR REPLACE FUNCTION customer_largest_order(cid bpchar) 
RETURNS double precision AS $$
	SELECT MAX(order_total) FROM
	(SELECT SUM(quantity*unitprice) as order_total,orderid
	FROM order_details
	NATURAL JOIN orders
	WHERE customerid=cid
	GROUP BY orderid) as order_total;
$$ LANGUAGE SQL;

SELECT customer_largest_order('ANATR');

-- example 2
CREATE OR REPLACE FUNCTION most_ordered_product(customerid bpchar) 
RETURNS varchar(40) AS $$
	SELECT productname
	FROM products
	WHERE productid IN
	(SELECT productid FROM
		(SELECT SUM(quantity) as total_ordered, productid
		FROM order_details
		NATURAL JOIN orders
		WHERE customerid= $1
		GROUP BY productid
		ORDER BY total_ordered DESC
		LIMIT 1) 
	as ordered_products);
$$ LANGUAGE SQL;

SELECT most_ordered_product('CACTU');
