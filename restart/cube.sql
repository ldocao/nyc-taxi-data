create table cube_trips as (
    select nt.vendor_id, nw.max_temperature, count(trip_id)
    from normalized_trips nt
    left join normalized_weather nw 
    on nt.pickup_datetime::date = nw.date
    group by cube(nt.vendor_id, nw.max_temperature)
)