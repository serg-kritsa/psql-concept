
WITH RECURSIVE upto(t) AS (
	SELECT 1
	UNION ALL
	SELECT t+1 FROM upto
	WHERE t < 50
)
SELECT * FROM upto


WITH RECURSIVE downfrom(t) AS (
	SELECT 500

	UNION ALL
	SELECT t-2 FROM downfrom
	WHERE t > 2
)
SELECT * FROM downfrom


WITH RECURSIVE under_responsible(firstname,lastname,title, employeeid,reportsto,level) AS (
	SELECT firstname,lastname,title,employeeid,reportsto,0 FROM employees
	WHERE employeeid=200
	UNION ALL
	SELECT Managed.firstname,Managed.lastname,Managed.title,Managed.employeeid,Managed.reportsto,level+1
	FROM employees AS managed
	JOIN under_responsible ON managed.reportsto=under_responsible.employeeid
)
SELECT * FROM under_responsible

WITH RECURSIVE report_to(firstname,lastname,title, employeeid,reportsto,level) AS (
	SELECT firstname,lastname,title,employeeid,reportsto,0 FROM employees
	WHERE employeeid=218
	UNION ALL
	SELECT manager.firstname,manager.lastname,manager.title,manager.employeeid,manager.reportsto,level+1
	FROM employees AS manager
	JOIN report_to ON report_to.reportsto=manager.employeeid
)
SELECT * FROM report_to
