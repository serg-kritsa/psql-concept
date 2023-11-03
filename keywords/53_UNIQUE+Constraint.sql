DROP TABLE IF EXISTS practices;

CREATE TABLE practices (
	practiceid integer UNIQUE,
  fieldname varchar(50) NOT NULL
);

INSERT INTO practices (practiceid,fieldname)
VALUES (1, 'field1');
INSERT INTO practices (practiceid,fieldname)
VALUES (1, 'field2');


DROP TABLE IF EXISTS pets;

CREATE TABLE pets (
	petid integer UNIQUE,
    name varchar(25) NOT NULL
)

ALTER TABLE region
ADD CONSTRAINT region_description UNIQUE(regiondescription);

ALTER TABLE shippers
ADD CONSTRAINT shippers_companyname UNIQUE(companyname);
