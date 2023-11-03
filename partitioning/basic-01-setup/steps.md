# PostgreSQL Partitioning 
[PostgreSQL Partitioning Tutorial](https://www.youtube.com/watch?v=edQZauVU-ws)

types:
- range
- list
- hash
n % 3 = 0
n % 3 = 1
n % 3 = 2

## connect to server shell
psql -p 5432 -d postgres

## create db
```sql
create database temp;
```
```sh
\c temp
```

## create partitioned table
create table partition_tablename partitions of parent_tablename for values from () to ();
```sql
create table (id integer, name text, age numeric) partition by range(age);
create table customers_young partitions of customers for values from (MINVALUE) to (25);
create table customers_medium partitions of customers for values from (25) to (75);
create table customers_old partitions of customers for values from (75) to (MAXVALUE);
```
```sh
\d+ customers
```

## fill partitioned table
```sql
insert into customers values (1, 'Bob', 20), (2,'Alice', 20), (3, 'Doe', 38), (4, 'Richard', 80);
select * from customers;
select tableoid::regclass, * from customers; -- the same w/ partition name;
```
