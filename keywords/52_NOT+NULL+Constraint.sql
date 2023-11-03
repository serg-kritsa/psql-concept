CREATE TABLE IF NOT EXISTS practices (
	practiceid integer NOT NULL
);

INSERT INTO practices (practiceid)
VALUES (null);

DROP TABLE IF EXISTS practices;

CREATE TABLE IF NOT EXISTS practices (
practiceid integer NOT NULL,
practice_field varchar(50) NOT NULL
);

ALTER TABLE products
ALTER COLUMN unitprice SET NOT NULL;

ALTER TABLE employees
ALTER COLUMN lastname SET NOT NULL;
