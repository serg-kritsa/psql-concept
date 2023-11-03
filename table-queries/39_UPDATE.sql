UPDATE orders
SET requireddate='2017-09-20',freight=50
WHERE orderid=11078;

UPDATE order_details
SET quantity=40,discount=.05
WHERE orderid=11078 AND productid=11;
