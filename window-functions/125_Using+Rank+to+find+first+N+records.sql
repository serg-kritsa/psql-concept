SELECT * FROM
(SELECT orders.orderid, productid, unitprice, quantity,
 	rank() OVER (PARTITION BY order_details.orderid ORDER BY (quantity*unitprice) DESC) AS rank_amount
FROM orders
NATURAL JOIN order_details) as ranked
WHERE rank_amount <=2;

SELECT companyname,productname,unitprice FROM
(SELECT companyname,productname,unitprice,
rank() OVER (PARTITION BY products.supplierid ORDER BY unitprice ASC) AS price_rank
FROM suppliers
NATURAL JOIN products) as ranked_products
WHERE price_rank <=3;
