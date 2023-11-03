-- Самое сложное — подменить по горячим следам старую таблицу на новую. И тут нужно запланировать блокировку старой таблицы и нашего сервиса.

-- 1 Заблокируем старую таблицу и все дочерние таблицы для того, чтобы внести нужные изменения.

LOCK TABLE orders IN ACCESS EXCLUSIVE MODE;
-- 2 Создадим последовательность для первичного ключа на новой таблице.

ALTER TABLE ONLY orders_new
  ALTER COLUMN id
  SET DEFAULT nextval('orders_new_id_seq'::regclass);
-- 3 Удалим триггеры со старой таблицы.

DROP FUNCTION IF EXISTS insert_data_into_orders_new_f CASCADE;
DROP FUNCTION IF EXISTS update_data_into_orders_new_f CASCADE;
-- 4 Переименуем оригинальную таблицу в старую, а секционированной таблице присвоим имя прежней таблицы. Также нам лучше переименовать дефолтную партицию.

ALTER TABLE orders RENAME TO orders_old;
ALTER TABLE orders_new RENAME TO orders;
ALTER TABLE orders_new_def RENAME TO orders_def;