CREATE SEQUENCE test_sequence;

SELECT nextval('test_sequence');
SELECT nextval('test_sequence');

SELECT currval('test_sequence');

SELECT lastval();

-- set value but next value will increment
SELECT setval('test_sequence',14);
SELECT nextval('test_sequence');

-- set value and next value will be what you set
SELECT setval('test_sequence',25,false);
SELECT nextval('test_sequence');

CREATE SEQUENCE IF NOT EXISTS test_sequence2 INCREMENT 5;

CREATE SEQUENCE IF NOT EXISTS test_sequence_3
INCREMENT 50 MINVALUE 350 MAXVALUE 5000 START WITH 550;

CREATE SEQUENCE IF NOT EXISTS test_sequence_4 INCREMENT 7 START WITH 33;

SELECT MAX(employeeid) FROM employees;

CREATE SEQUENCE IF NOT EXISTS employees_employeeid_seq
START WITH 10 OWNED BY employees.employeeid;

--This insert will fail
INSERT INTO employees
(lastname,firstname,title,reportsto)
VALUES ('Smith','Bob', 'Assistant', 2);

--must alter the default value
ALTER TABLE employees
ALTER COLUMN employeeid SET DEFAULT nextval('employees_employeeid_seq');

--Now Insert will work
INSERT INTO employees
(lastname,firstname,title,reportsto)
VALUES ('Smith','Bob', 'Assistant', 2);

INSERT INTO users (name,age) VALUES (‘Liszt’,10) RETURNING id;

SELECT MAX(orderid) FROM orders;

CREATE SEQUENCE IF NOT EXISTS orders_orderid_seq START WITH 11077;

ALTER TABLE orders
ALTER COLUMN orderid SET DEFAULT nextval('orders_orderid_seq');

INSERT INTO orders (customerid,employeeid,requireddate,shippeddate)
VALUES ('VINET',5,'1996-08-01','1996-08-10') RETURNING orderid;


