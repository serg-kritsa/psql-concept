-- example 1
CREATE OR REPLACE FUNCTION sold_more_than(total_sales real)
RETURNS SETOF products AS $$
BEGIN

 RETURN QUERY SELECT * FROM products
 WHERE productid IN (
	 SELECT productid FROM
 	 (SELECT SUM(quantity*unitprice),productid
	 FROM order_details
	 GROUP BY productid
	 HAVING SUM(quantity*unitprice) > total_sales) as qualified_products
 	);

-- 			built-in boolean variable
  IF NOT FOUND THEN
--   														function param
  	RAISE EXCEPTION 'Nn products had sales higher than %.', $1;
  	-- RAISE EXCEPTION 'Nn products had sales higher than %.', total_sales; -- way 2
  END IF;

  RETURN;
END;
$$ LANGUAGE plpgsql;

SELECT productname, productid, supplierid
FROM sold_more_than(15000);
-- FROM sold_more_than(250000); -- exception

-- example 2
CREATE OR REPLACE FUNCTION after_christmas_sale() RETURNS SETOF products AS $$
DECLARE
	product record;
BEGIN
	FOR product IN
		SELECT * FROM products
	LOOP
		-- some processing here
		IF product.categoryid IN (1,4,8) THEN
			product.unitprice = product.unitprice * .80; -- -20%
		ELSIF product.categoryid IN (2,3,7) THEN
			product.unitprice = product.unitprice * .75; -- -25%
		ELSE
			product.unitprice = product.unitprice * 1.10; -- +10%
		END IF;
		RETURN NEXT product; -- return current row of SELECT
	END LOOP;

	RETURN; -- ??? for SETOF

END;
$$ LANGUAGE plpgsql;

SELECT * FROM after_christmas_sale();
