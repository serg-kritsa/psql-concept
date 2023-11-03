DROP TABLE IF EXISTS practices;

CREATE TABLE practices (
	practiceid integer PRIMARY KEY,
	practicefield varchar(50) NOT NULL,
	employeeid integer NOT NULL,
	FOREIGN KEY (employeeid) REFERENCES employees(employeeid)
)


DROP TABLE IF EXISTS pets;

CREATE TABLE pets (
	petid integer PRIMARY KEY,
	name varchar(25) NOT NULL,
	customerid char(5) NOT NULL,
	FOREIGN KEY (customerid) REFERENCES customers(customerid)
)

ALTER TABLE practices
DROP CONSTRAINT practices_employeeid_fkey;

ALTER TABLE practices
ADD CONSTRAINT practices_employee_fkey
FOREIGN KEY (employeeid) REFERENCES employees(employeeid);

ALTER TABLE pets
DROP CONSTRAINT pets_customerid_fkey;

ALTER TABLE pets
ADD CONSTRAINT pets_customerid_fkey
FOREIGN KEY (customerid) REFERENCES customers(customerid);
