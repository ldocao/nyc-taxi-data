#!/bin/bash


sudo apt-get update
sudo apt-get install -y htop iotop emacs
sudo apt-get install -y postgresql postgresql-contrib
#do manually:
# sudo su postgres
# psql
# ALTER USER postgres WITH PASSWORD 'K2f7mstuzakFFspH';
# modify /etc/postgresql/13/main/pg_hba.conf change peer > md5 (see https://stackoverflow.com/questions/18664074/getting-error-peer-authentication-failed-for-user-postgres-when-trying-to-ge)
# sudo service postgresql restart
