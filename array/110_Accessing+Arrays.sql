SELECT children[2]
FROM friends;

SELECT pay_by_quarter[2:3]
FROM salary_employees;

SELECT array_dims(schedule)
FROM salary_employees;

SELECT array_length(schedule,1),array_length(schedule,2)
FROM salary_employees;
