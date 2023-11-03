DROP TABLE IF EXISTS practices;

CREATE TABLE practices (
	practiceid integer PRIMARY KEY,
	practicefield varchar(50) NOT NULL,
	employeeid integer NOT NULL,
	cost integer CONSTRAINT practices_cost CHECK (cost >= 0 AND cost <= 1000),
	FOREIGN KEY (employeeid) REFERENCES employees(employeeid)
);

DROP TABLE IF EXISTS pets;

CREATE TABLE pets (
	petid integer PRIMARY KEY,
	name varchar(25) NOT NULL,
	customerid char(5) NOT NULL,
	weight integer CONSTRAINT pets_weight CHECK (weight > 0 AND weight < 200),
	FOREIGN KEY (customerid) REFERENCES customers(customerid)
);

ALTER TABLE orders
ADD CONSTRAINT orders_freight CHECK (freight > 0);

ALTER TABLE products
ADD CONSTRAINT products_unitprice CHECK (unitprice > 0);
