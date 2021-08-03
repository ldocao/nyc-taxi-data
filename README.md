## nyc-taxi-data

originally from https://github.com/toddwschneider/nyc-taxi-data

You can go directly to step 4 if you already have normalized and denormalized datasets.

1. import into postgresql with run.sh
2. delete the raw data because it eats up space. Then, create normalized and denormalized datasets for other technologies with output*.sql
3. upload all the files to gcs
4. delete the VM and reinitialize postgresql with only normalized/denormalized (this is useful if you want to decrease the size of the hard drive, and be able to stop/start the VM without losing everything)