ALTER TABLE email_subscribers
ADD COLUMN last_visit_date timestamp;

ALTER TABLE bad_orders
ADD COLUMN reason text;


ALTER TABLE email_subscribers
DROP COLUMN last_visit_date;

ALTER TABLE bad_orders
DROP COLUMN reason;
