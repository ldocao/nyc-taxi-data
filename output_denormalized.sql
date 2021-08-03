COPY (
    SELECT trips.id,
           trips.vendor_id,
           trips.pickup_datetime,
           trips.dropoff_datetime,
           trips.store_and_fwd_flag,
           trips.rate_code_id,
           trips.pickup_longitude,
           trips.pickup_latitude,
           trips.dropoff_longitude,
           trips.dropoff_latitude,
           trips.passenger_count,
           trips.trip_distance,
           trips.fare_amount,
           trips.extra,
           trips.mta_tax,
           trips.tip_amount,
           trips.tolls_amount,
           trips.ehail_fee,
           trips.improvement_surcharge,
           trips.total_amount,
           trips.payment_type,
           trips.trip_type,

           weather.precipitation rain,
           weather.snow_depth,
           weather.snowfall,
           weather.max_temperature max_temp,
           weather.min_temperature min_temp,
           weather.average_wind_speed wind

    FROM trips
    LEFT JOIN central_park_weather_observations weather
        ON weather.date = trips.pickup_datetime::date
) TO PROGRAM
    'split -l 20000000 --filter="gzip > /nyc-taxi-data/output/denormalized/trips_\$FILE.csv.gz"'
    WITH CSV;