-- Следующим шагом будет генерация функций для создания и удаления секций, это будет нужно для последующей автоматизации.

CREATE OR REPLACE FUNCTION create_partition_for_orders(user_id bigint) RETURNS VOID AS
  $BODY$
    DECLARE
      partition_name TEXT;
    BEGIN
      partition_name := 'orders' || '_u' || user_id::text;

      IF NOT EXISTS(SELECT relname FROM pg_class WHERE relname=partition_name) THEN
        RAISE NOTICE 'A partition has been created %', partition_name;

        EXECUTE 'CREATE TABLE ' || partition_name || ' PARTITION OF orders FOR VALUES IN ('|| user_id ||');';
      END IF;
    END;
  $BODY$
LANGUAGE plpgsql

CREATE OR REPLACE FUNCTION drop_partition_for_orders(user_id bigint) RETURNS VOID AS
  $BODY$
    DECLARE
      partition_name TEXT;
    BEGIN
      partition_name := 'orders' || '_u' || user_id::text;

      IF EXISTS(SELECT relname FROM pg_class WHERE relname=partition_name) THEN
        RAISE NOTICE 'A partition has been droped %', partition_name;

        EXECUTE 'DROP TABLE ' || partition_name || ' CASCADE;';
      END IF;
    END;
  $BODY$
LANGUAGE plpgsql;