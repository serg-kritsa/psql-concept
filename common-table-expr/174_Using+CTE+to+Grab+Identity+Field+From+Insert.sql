WITH new_order AS (
	INSERT INTO orders
	(customerid, employeeid, orderdate, requireddate)
	VALUES ('ALFKI', 1, '1997-03-10', '1997-03-25')
	RETURNING orderid
)

INSERT INTO order_details (orderid, productid, unitprice, quantity, discount)
SELECT orderid, 1, 20, 5, 0
FROM new_order;

SELECT * FROM orders
ORDER BY orderid DESC
LIMIT 1;

SELECT * FROM order_details
WHERE orderid = (SELECT MAX(orderid) FROM orders);

WITH new_employee AS (
	INSERT INTO employees
	(lastname,firstname,title,reportsto)
	VALUES ('Doger','Roger', 'Assistant', 2)
	RETURNING employeeid
)
INSERT INTO orders
(customerid, employeeid, orderdate, requireddate)
SELECT 'ALFKI', employeeid, '1997-03-10', '1997-03-25'
FROM new_employee;

SELECT * FROM employees
ORDER BY employeeid DESC
LIMIT 1;

SELECT * FROM orders
ORDER BY orderid DESC
LIMIT 1;
