-- example 1
START TRANSACTION;

UPDATE orders
SET orderdate = orderdate + INTERVAL '1 YEAR';

ROLLBACK;

-- example 2
START TRANSACTION;

INSERT INTO employees (employeeid,lastname,firstname,title,birthdate,hiredate)
VALUES (501,'Sue','Jones','Operations Assistant','1999-05-23','2017-06-13');

SAVEPOINT inserted_employee;

UPDATE employees
SET birthdate='2025-07-11'; -- considered as typo

ROLLBACK TO inserted_employee;

UPDATE employees
SET birthdate='1998-05-23'
WHERE employeeid=501;

COMMIT;

-- see result
SELECT *
FROM employees
WHERE employeeid=501;
