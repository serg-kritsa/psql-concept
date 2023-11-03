-- example 1
CREATE OR REPLACE PROCEDURE add_em(x int, y int) AS $$
	SELECT x + y
$$ LANGUAGE SQL;

CALL add_em(5,3);

-- example 2
CREATE OR REPLACE PROCEDURE change_supplier_prices(supplierid smallint, amount real) AS $$
	UPDATE products
	SET unitprice = unitprice + amount
	WHERE supplierid = $1

$$ LANGUAGE;

CALL change_supplier_prices(20::smallint, 0.50);
