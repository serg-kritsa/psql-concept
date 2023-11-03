CREATE TABLE subscribers (
	firstname varchar(200),
	 lastname varchar(200),
	email varchar(250),
	signup timestamp,
	frequency integer,
	iscustomer boolean
);

CREATE TABLE returns (
	returnrid serial,
	customerid char(5),
	returndate timestamp,
	productid integer,
	quantity smallint,
	orderid integer
);
