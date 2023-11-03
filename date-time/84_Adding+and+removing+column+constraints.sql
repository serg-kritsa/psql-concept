ALTER TABLE products
ADD CHECK ( reorderlevel > 0);

-- All rows must meet the condition
UPDATE products
SET reorderlevel = 0
WHERE reorderlevel is null or reorderlevel < 0;

ALTER TABLE products
ALTER COLUMN discontinued SET NOT NULL;

ALTER TABLE products
DROP CONSTRAINT products_reorderlevel_check;

ALTER TABLE products
ALTER COLUMN discontinued DROP NOT NULL;

ALTER TABLE order_details
ADD CHECK (unitprice > 0);

ALTER TABLE order_details
ALTER COLUMN discount SET NOT NULL;

ALTER TABLE order_details
DROP CONSTRAINT order_details_unitprice_check;

ALTER TABLE order_details
ALTER COLUMN discount DROP NOT NULL;
