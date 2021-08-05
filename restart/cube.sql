drop table if exists cube_trips;

create table cube_trips as (
    select nt.vendor_id, extract(year from nw.date) as year, nw.max_temperature, count(trip_id) as count
    from normalized_trips nt
    left join normalized_weather nw 
    on nt.pickup_datetime::date = nw.date
    group by cube(nt.vendor_id, extract(year from nw.date), nw.max_temperature)
);