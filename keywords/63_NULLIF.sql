UPDATE suppliers
SET homepage = ''
WHERE homepage IS NULL;

UPDATE customers
SET fax = ''
WHERE fax IS NULL;

SELECT companyname,phone,
COALESCE(NULLIF(homepage,''),'Need to call')
FROM suppliers;

SELECT companyname,
COALESCE(NULLIF(fax,''),phone) AS confirmation
FROM customers;
