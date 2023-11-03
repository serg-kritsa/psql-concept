SELECT *
FROM friends
WHERE children[0] = 'Billy' OR children[1] = 'Billy'
OR children[2]='Billy' OR children[3]='Billy';

SELECT *
FROM friends
WHERE 'Austin' = ANY (children)

SELECT *
FROM salary_employees
WHERE 'sales call' = ANY (schedule);
