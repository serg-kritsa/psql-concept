WITH top_category_sales AS (
 SELECT categoryname,SUM(od.unitprice*quantity) AS sales
	FROM categories AS c
	JOIN PRODUCTS USING(categoryid)
	JOIN order_details AS od USING (productid)
	GROUP BY categoryname
	ORDER BY sales DESC LIMIT 3
)
SELECT categoryname,productname,SUM(od.quantity) AS product_units,
SUM(od.unitprice*quantity) AS product_sales
FROM categories AS c
JOIN PRODUCTS USING(categoryid)
JOIN order_details AS od USING (productid)
WHERE categoryname IN (SELECT categoryname FROM top_category_sales)
GROUP BY categoryname,productname
ORDER BY categoryname


WITH slowest_products AS (
	SELECT productid,SUM(od.quantity)
	FROM products
	JOIN order_details AS od USING (productid)
	GROUP BY productID
	ORDER BY SUM(od.quantity) ASC
	LIMIT 2
)
SELECT DISTINCT(companyname)
FROM customers
NATURAL JOIN orders
NATURAL JOIN order_details
WHERE productid IN (SELECT productid FROM  slowest_products)
