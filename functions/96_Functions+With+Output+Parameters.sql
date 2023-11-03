-- example 1
CREATE OR REPLACE FUNCTION sum_n_product (
	x int, y int,
	OUT sum int,
	OUT product int
) AS $$
	SELECT x + y, x * y
$$ LANGUAGE SQL;

SELECT sum_n_product(5, 20); -- sum_n_product: record: (25,100)
SELECT (sum_n_product(5, 20)).*;

-- example 2
CREATE OR REPLACE FUNCTION square_n_cube(
	IN x int,
	OUT square int,
	OUT cube int
) AS $$
	SELECT x * x, x*x*x;
$$ LANGUAGE SQL;

SELECT (square_n_cube(55)).*; -- square: int: 3025 , cube: int: 166375
