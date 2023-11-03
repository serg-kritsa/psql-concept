SELECT *
INTO suppliers_northamerica
FROM suppliers
WHERE country in ('USA','Canada');

SELECT *
INTO orders_1997
FROM orders
WHERE orderdate BETWEEN '1997-01-01' AND '1997-12-31';
