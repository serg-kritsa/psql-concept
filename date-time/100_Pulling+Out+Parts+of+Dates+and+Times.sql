SELECT EXTRACT(YEAR FROM age(birthdate)),firstname, lastname
FROM employees;

SELECT date_part('day', shippeddate)
FROM orders;

SELECT EXTRACT(DECADE FROM age(birthdate)),firstname, lastname
FROM employees;

SELECT date_part('DECADE',age(birthdate)),firstname, lastname
FROM employees;
