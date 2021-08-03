#!/bin/bash

export PGPASSWORD=K2f7mstuzakFFspH

psql -U postgres -f denormalized.sql
psql -U postgres -f normalized.sql


files=`ls -1 $HOME/nyc-taxi-data/denormalized/*.csv.gz`
for f in $files; do
    psql -d postgres -U postgres -p 5432 -c "\copy denormalized_trips FROM PROGRAM 'gzip -dc $f' DELIMITER ',' CSV HEADER NULL ''" &
done

files=`ls -1 $HOME/nyc-taxi-data/normalized/*.csv.gz`
for f in $files; do
    psql -d postgres -U postgres -p 5432 -c "\copy normalized_trips FROM PROGRAM 'gzip -dc $f' DELIMITER ',' CSV HEADER NULL ''" &
done