DROP TABLE IF EXISTS exes;

CREATE TABLE exes (
    exid SERIAL,
    name varchar(255)
);
INSERT INTO exes (name) VALUES ('Carrie') RETURNING exid
--
DROP TABLE IF EXISTS pets;

CREATE TABLE pets (
    petid SERIAL,
    name varchar(255)
);

INSERT INTO pets (name) VALUES ('Fluffy') RETURNING petid;


-- -- SERIAL is equivalent to
-- CREATE SEQUENCE IF NOT EXISTS tablename_colname_seq
-- CREATE TABLE IF NOT EXISTS tablename (
--     colname integer NOT NULL DEFAULT  nextval('tablename_colname_seq')
-- )
-- ALTER SEQUENCE tablename_colname_seq OWNED BY tablename.colname;
