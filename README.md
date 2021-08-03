## nyc-taxi-data

originally from https://github.com/toddwschneider/nyc-taxi-data

1. import into postgresql with run.sh
2. delete the raw data because it eats up space. Then, create normalized and denormalized datasets for other technologies with output*.sql
3. upload all the files to gcs
4. delete the VM and reinitialize postgresql with restart/restart.sh (to have only normalized and denormalized table)
