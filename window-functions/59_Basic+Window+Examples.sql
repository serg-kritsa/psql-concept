SELECT companyname, orderid, amount , average_order FROM
( SELECT companyname, orderid, amount ,AVG(amount) OVER (PARTITION BY companyname) AS average_order
FROM
(SELECT companyname,orders.orderid,SUM(unitprice*quantity) AS amount
FROM customers
JOIN orders ON orders.customerid=customers.customerid
JOIN order_details ON orders.orderid=order_details.orderid
GROUP BY companyname,orders.orderid) as order_amounts) as order_averages
WHERE amount > 5 * average_order
ORDER BY companyname
