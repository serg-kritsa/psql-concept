SELECT customerid,COALESCE(shipregion,'N/A') FROM orders;

SELECT companyname,COALESCE(homepage,'Call to find') from suppliers;
