CREATE TABLE normalized_trips (
    trip_id                 bigint,
    vendor_id               varchar,

    pickup_datetime         timestamp,
    dropoff_datetime        timestamp,

    store_and_fwd_flag      VARCHAR(1),
    rate_code_id            integer,
    pickup_longitude        double precision,
    pickup_latitude         double precision,
    dropoff_longitude       double precision,
    dropoff_latitude        double precision,
    passenger_count         integer,
    trip_distance           double precision,
    fare_amount             numeric,
    extra                   numeric,
    mta_tax                 numeric,
    tip_amount              numeric,
    tolls_amount            numeric,
    ehail_fee               numeric,
    improvement_surcharge   numeric,
    total_amount            numeric,
    payment_type            varchar,
    trip_type               integer
) ;


CREATE TABLE normalized_weather (
    date        date,
    precipitation           numeric,
    snow_depth              numeric,
    snowfall                numeric,
    max_temperature         integer,
    min_temperature         integer,
    average_wind_speed      numeric
) ;