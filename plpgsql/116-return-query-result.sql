CREATE OR REPLACE FUNCTION get_all_products()
RETURNS SETOF products AS $$
	BEGIN
		RETURN QUERY SELECT * FROM products;
	END;
$$ LANGUAGE plpgsql;

SELECT * FROM get_all_products();