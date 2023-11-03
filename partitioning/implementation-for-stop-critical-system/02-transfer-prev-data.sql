-- - moving data step 
-- if not created before
create table dailytotals_2020
partition of dailytotals
for values from ('2020-01-01') to ('2021-01-01');
-- run better during quiet hours for the system, in scheduled batch jobs, etc.
with tmp_dailytotals_2020 as (
    delete from dailytotals_legacy d
    where (totaldate >= '2020-01-01' and totaldate < '2021-01-01')
    returning d.*
)
insert into dailytotals select * from tmp_dailytotals_2020;

-- continue w/ other periods data
