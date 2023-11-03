ALTER SEQUENCE employees_employee_seq RESTART WITH 1000
SELECT nextval('employees_employee_seq')

ALTER SEQUENCE orders_orderid_seq RESTART WITH 200000
SELECT nextval('orders_orderid_seq')

ALTER SEQUENCE test_sequence RENAME TO test_sequence_1

ALTER SEQUENCE test_sequence_4  RENAME TO test_sequence_four

DROP SEQUENCE test_sequence_1

DROP SEQUENCE test_sequence_four
