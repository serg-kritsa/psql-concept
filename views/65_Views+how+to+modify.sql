CREATE OR REPLACE VIEW customer_order_details AS
SELECT companyname, Orders.customerid,employeeid,requireddate,shippeddate,
Shipvia,freight,shipname,shipcity,shipregion,shippostalcode,shipcountry,
order_details.*,contactname
FROM customers
JOIN orders on customers.customerid=orders.customerid
JOIN order_details on order_details.orderid=orders.orderid;

CREATE OR REPLACE VIEW supplier_order_details AS
SELECT companyname,suppliers.supplierid,
Products.productid,productname,
Order_details.unitprice,quantity,discount,
orders.*,phone
FROM suppliers
JOIN products ON suppliers.supplierid=products.supplierid
JOIN order_details ON order_details.productid=products.productid
JOIN orders ON order_details.orderid=orders.orderid;

ALTER VIEW customer_order_details RENAME TO customer_order_detailed;

ALTER VIEW supplier_order_details RENAME TO supplier_orders;
