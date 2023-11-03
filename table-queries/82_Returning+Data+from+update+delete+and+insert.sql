INSERT INTO employees
(firstname,lastname,address,city,country,postalcode,homephone,title,employeeid,reportsto)
VALUES
('Bob','Smith','463-4613 Ipsum Street','New Orleans','USA','73-638','741-0423','Chief Strategy',50,NULL)
RETURNING employeeid;

INSERT INTO orders (customerid,employeeid,requireddate,shippeddate,orderid)
VALUES ('VINET',5,'1996-08-01','1996-08-10',500) RETURNING orderid;

UPDATE products
SET unitprice = unitprice * 1.2
WHERE productid=1
RETURNING productid,unitprice AS new_price;


UPDATE order_details
SET quantity = quantity * 2
WHERE orderid=10248 AND productid=11
RETURNING quantity AS new_quantity;

DELETE FROM employees
WHERE employeeid=50
RETURNING *;

DELETE FROM orders
WHERE orderid=500
RETURNING *;
