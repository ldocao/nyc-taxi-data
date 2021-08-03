#!/bin/bash


./download_raw_data.sh
./download_raw_2014_uber_data.sh
./remove_bad_rows.sh
./initialize_database.sh
./import_trip_data.sh
./import_fhv_trip_data.sh
./import_2014_uber_trip_data.sh