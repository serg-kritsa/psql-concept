ALTER TABLE subscribers
RENAME firstname TO first_name;

ALTER TABLE returns
RENAME returndate TO return_date;

ALTER TABLE subscribers
RENAME TO email_subscribers;

ALTER TABLE returns
RENAME TO bad_orders;
