DROP TABLE IF EXISTS friends;


CREATE TABLE friends (
    name full_name,
    address address,
    specialdates dates_to_remember,
    children varchar(50) ARRAY
);

DROP TABLE IF EXISTS salary_employees;

CREATE TABlE salary_employees (
    name text,
    pay_by_quarter integer[4],
	schedule text[][]
)
