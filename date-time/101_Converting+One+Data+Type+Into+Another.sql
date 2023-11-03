SELECT hiredate::TIMESTAMP
FROM employees;

SELECT CAST(hiredate AS TIMESTAMP)
FROM employees;

SELECT (ceil(unitprice*quantity))::TEXT || ' dollars spent'
FROM order_details;

SELECT CAST('2015-10-03' AS DATE),  375::TEXT;
