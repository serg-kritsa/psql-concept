--  Следующим шагом мы создадим триггеры для автоматической вставки и обновления данных из старой таблицы в новую. Что интересно: за счёт декларативного метода секционирования нам не нужно указывать конкретную партицию, куда будет идти вставка данных. И мы можем воспользоваться триггерами, которые мы использовали для копирования таблицы.

CREATE OR REPLACE FUNCTION orders_mirror_f ()
  RETURNS TRIGGER
  AS $body$
BEGIN
  IF TG_OP = 'INSERT' THEN
    INSERT INTO orders_new
    SELECT
      NEW.*;
    RETURN NEW;
  ELSIF TG_OP = 'UPDATE' THEN
    UPDATE
      orders_new
    SET
      user_id = NEW.user_id,
      value = NEW.value
    WHERE
      id = OLD.id;
    RETURN NEW;
  END IF;
END;
$body$
LANGUAGE 'plpgsql';

CREATE TRIGGER trigger_orders
	AFTER INSERT
	OR UPDATE ON orders
	FOR EACH ROW
	EXECUTE PROCEDURE orders_mirror_f ();
