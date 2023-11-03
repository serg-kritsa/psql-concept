-- Создадим копию нашей таблицы orders, но уже с использованием секционирования. На данном этапе важно не забыть про индексы, констрейты, права доступа к которым есть у оригинальной таблицы, а также создать дефолтную секцию.
CREATE TABLE orders_new (
  id integer NOT NULL,
  user_id integer NOT NULL,
  value bigint DEFAULT 0 NOT NULL,
) PARTITION BY LIST (user_id);

ALTER TABLE ONLY orders_new ALTER COLUMN id SET DEFAULT nextval('orders_id_seq'::regclass);

-- constraints
ALTER TABLE ONLY orders_new ADD CONSTRAINT orders_new_pkey PRIMARY KEY (id, user_id);
ALTER TABLE ONLY orders_new ADD CONSTRAINT positive_value CHECK (value >= 0);

-- indexes
CREATE INDEX idx_orders_new_user_id_and_value ON orders_new
  USING btree (user_id, value DESC);

-- default partition
CREATE TABLE orders_new_def PARTITION OF orders_new DEFAULT;

-- Секция по умолчанию нужна для того, чтобы туда вносились записи, для которых не нашлось секции по ключу секционирования (например, вы забыли создать нужные секции, или не отработал какой-то механизм их автоматического создания).