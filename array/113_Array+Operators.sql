-- equal
SELECT ARRAY[1, 2, 3, 4] = ARRAY[1, 2, 3, 4];

-- not equal, the elements are not in same order
SELECT ARRAY[1, 2, 4, 3] = ARRAY[1, 2, 3, 4];

-- true
SELECT ARRAY[1, 2, 4, 3] > ARRAY[1, 2, 3, 4];

-- false
SELECT ARRAY[1, 2, 3, 4] > ARRAY[1, 2, 3, 4];

-- false 3 smaller than 4, doesn't look at 5 greater than 4
SELECT ARRAY[1, 2, 3, 5] > ARRAY[1, 2, 4, 4];

-- true
SELECT ARRAY[1, 2, 3, 5] @> ARRAY[2, 5];

-- false
SELECT ARRAY[1, 2, 3, 5] @> ARRAY[2, 5, 7];

-- true
SELECT ARRAY[1, 2] <@ ARRAY[2, 5, 7, 1];

-- true
SELECT ARRAY[1, 2, 13, 17] && ARRAY[2, 5, 7, 1];

--false
SELECT ARRAY[ 13, 17] && ARRAY[2, 5, 7, 1];

SELECT *
FROM friends
WHERE children && ARRAY['Billy'::varchar(50)];

SELECT *
FROM salary_employees
WHERE schedule && ARRAY['sales call'];
