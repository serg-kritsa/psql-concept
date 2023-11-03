DROP TABLE performance_test
CREATE TABLE performance_test(
    id serial,
    location text
);

INSERT INTO performance_test (location)
SELECT 'Katmandu, Nepal' FROM generate_series(1,500000000);