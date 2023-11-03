ALTER TABLE email_subscribers
ALTER COLUMN email SET DATA TYPE varchar(225);

ALTER TABLE bad_orders
ALTER COLUMN quantity SET DATA TYPE int;
