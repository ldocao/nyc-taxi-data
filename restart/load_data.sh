#!/bin/bash

export PGPASSWORD=K2f7mstuzakFFspH

psql -U postgres -f denormalized.sql
psql -U postgres -f normalized.sql
psql -d postgres -U postgres -p 5432 -c "\copy normalized_weather FROM PROGRAM 'gzip -dc $HOME/nyc-taxi-data/normalized/weather_xaa.csv.gz' DELIMITER ',' CSV HEADER NULL ''" &


files=`ls -1 $HOME/nyc-taxi-data/denormalized/*.csv.gz`
N=`grep -c ^processor /proc/cpuinfo`
for f in $files; do
    ((i=i%N)); ((i++==0)) && wait #parallel run only N at a time ; see https://unix.stackexchange.com/questions/103920/parallelize-a-bash-for-loop
    psql -d postgres -U postgres -p 5432 -c "\copy denormalized_trips FROM PROGRAM 'gzip -dc $f' DELIMITER ',' CSV HEADER NULL ''" &
done

wait

files=`ls -1 $HOME/nyc-taxi-data/normalized/trips*.csv.gz`
for f in $files; do
    ((i=i%N)); ((i++==0)) && wait
    psql -d postgres -U postgres -p 5432 -c "\copy normalized_trips FROM PROGRAM 'gzip -dc $f' DELIMITER ',' CSV HEADER NULL ''" &
done

#precompute some solution because they take several hours to run
psql -U postgres -f cube.sql
psql -U postgres -f index.sql
