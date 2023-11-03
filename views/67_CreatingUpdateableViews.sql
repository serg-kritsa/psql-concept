CREATE VIEW north_america_customers AS
SELECT *
FROM customers
WHERE country in ('USA','Canada','Mexico');

INSERT INTO north_america_customers
(customerid,companyname,contactname,contacttitle,address,city,region,postalcode,country,phone,fax)
VALUES ('CFDCM','Catfish Dot Com','Will Bunker','President','Old Country Road','Lake Village','AR','71653','USA','555-555-5555',null);

UPDATE north_america_customers SET fax='555-333-4141' WHERE customerid='CFDCM';

DELETE FROM north_america_customers WHERE customerid='CFDCM';

CREATE VIEW protein_products AS
SELECT * FROM products
WHERE categoryid in (4,6,8);

INSERT INTO protein_products
(productid,productname,supplierid,categoryid,discontinued)
VALUES (78,'Kobe Beef',12,8,0);

UPDATE protein_products SET unitprice=55 WHERE productid=78;

DELETE FROM protein_products WHERE productid=78;
