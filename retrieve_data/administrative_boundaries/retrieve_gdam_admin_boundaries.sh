#!/bin/bash
mkdir gadm_data
wget -P ./gadm_data https://biogeo.ucdavis.edu/data/gadm3.6/gadm36_shp.zip
cd ./gadm_data
unzip ./gadm36_shp.zip
rm ./gadm_data/gadm36_shp.zip

psql -U oryx -d debian_db -p 5432 -c "CREATE SCHEMA IF NOT EXISTS admin;"
shp2pgsql -I -s 4326  ./gadm36.shp admin.gadm36 | psql -U oryx -p 5432 -h localhost -d debian_db
cd ../
rm -rf ./gadm_data


