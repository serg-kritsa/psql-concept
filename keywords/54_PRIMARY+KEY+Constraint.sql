DROP TABLE IF EXISTS practices;

CREATE TABLE practices (
	practiceid integer PRIMARY KEY,
	fieldname varchar(50) NOT NULL
);

INSERT INTO practices (practiceid,fieldname)
VALUES (1, null);
INSERT INTO practices (practiceid,fieldname)
VALUES (1, 'field1');
INSERT INTO practices (practiceid,fieldname)
VALUES (1, 'field2');

DROP TABLE IF EXISTS pets;

CREATE TABLE pets (
	petid integer PRIMARY KEY,
	name varchar(25) NOT NULL
);

ALTER TABLE practices
DROP CONSTRAINT practices_pkey;

ALTER TABLE practices
ADD PRIMARY KEY (practiceid);

ALTER TABLE pets
DROP CONSTRAINT pets_pkey;

ALTER TABLE pets
ADD PRIMARY KEY (petid);
