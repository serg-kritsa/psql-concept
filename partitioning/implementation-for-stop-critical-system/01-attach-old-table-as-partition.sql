-- run better before loading new data from sftp archive
begin;

-- - renaming step
alter table dailytotals rename to dailytotals_legacy;
alter index dailytotals_butchid rename to dailytotals_legacy_butchid;
-- other indices if needed

-- - creating partitioned table step
-- note: dailytotals_seq sequence in orig db 
create table dailytotals (
    totalid     bigint  not null --default nextval('dailytotals_seq')
    ,totaldate  date    not null
    ,totalsum   bigint
    -- ...
    ,batchid    bigint  not null
) partition by range (totaldate);
create index dailytotals_butchid on dailytotals(butchid);

-- - creating new data partition step
create table dailytotals_202106
partition of dailytotals
for values from ('2021-06-01') to ('2021-07-01');

FOR VALUES FROM ('2023-09-01 00:00:00') TO ('2023-10-01 00:00:00')

do$$
-- set boundaries
declare earliest date;
declare latest date;
begin
select min(totaldate) into earliest from dailytotals_legacy;
latest := '2021-06-01'::date;

-- ??? may this be skipped if data is trusted ???
-- avoid full table scan by postgres
-- only use for trusted data
alter table dailytotals_legacy
add constraint dailytotals_legacy_totaldate
check (totaldate >= earliest AND totaldate < latest)
not valid;

-- to skip validation of huge table (f.e. 20TB)
-- select conname ,convalidated from pg_catalog.pg_constraint ;
update pg_catalog.pg_constraint
set convalidated = true
where conname = 'dailytotals_legacy_totaldate';
-- /??? may this be skipped if data is trusted ???

-- - attach old table as a partition as psql-procedure
alter table dailytotals
attach partition dailytotals_legacy
for values from (earliest) to (latest);

end;
$$ language plpgsql;
commit;
