ALTER TABLE employees
ADD COLUMN last_updated timestamp;

CREATE OR REPLACE FUNCTION employees_timestamp() RETURNS trigger AS $$
BEGIN

	NEW.last_updated := now();
	RETURN NEW;

END;
$$ LANGUAGE plpgsql;

DROP TRIGGER IF EXISTS employees_timestamp ON employees;

CREATE TRIGGER employees_timestamp BEFORE INSERT OR UPDATE ON employees
	FOR EACH ROW EXECUTE FUNCTION employees_timestamp();

SELECT last_updated,*FROM EMPLOYEES
WHERE employeeid=1;

UPDATE employees
SET address = '27 West Bird Lane'
WHERE employeeid=1;

SELECT last_updated FROM EMPLOYEES
WHERE employeeid=1;

-- product example
ALTER TABLE products
ADD COLUMN last_updated timestamp;

CREATE OR REPLACE FUNCTION products_timestamp() RETURNS trigger AS $$
BEGIN

	NEW.last_updated := now();
	RETURN NEW;

END;
$$ LANGUAGE plpgsql;

DROP TRIGGER IF EXISTS products_timestamp ON products;

CREATE TRIGGER products_timestamp BEFORE INSERT OR UPDATE ON products
	FOR EACH ROW EXECUTE FUNCTION products_timestamp();

SELECT last_updated,* FROM products
WHERE productid=2;

UPDATE products
SET unitprice=19.05
WHERE productid=2;

SELECT last_updated,* FROM products
WHERE productid=2;
