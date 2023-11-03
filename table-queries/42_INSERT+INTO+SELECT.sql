INSERT INTO suppliers_northamerica
SELECT *
FROM suppliers
WHERE country IN ('Brazil','Argentina')

INSERT INTO orders_1997
SELECT * FROM orders
WHERE orderdate BETWEEN '1996-12-01' AND '1996-12-31'
