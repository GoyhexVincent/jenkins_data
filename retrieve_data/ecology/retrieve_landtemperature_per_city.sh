#!/bin/bash

wget https://raw.githubusercontent.com/carloapp2/DatapaloozaChallenge/master/GlobalLandTemperaturesByMajorCity.csv

psql -U oryx -d debian_db -p 5432 -c "CREATE SCHEMA IF NOT EXISTS ecology;"
psql -U oryx -d debian_db -p 5432 -c "DROP TABLE IF EXISTS ecology.global_land_temperatures_by_major_city;"
psql -U oryx -d debian_db  -p 5432 -c "CREATE TABLE ecology.global_land_temperatures_by_major_city(


    date varchar,
    averageemperature float,
    uncertainty float,
    city varchar,
    country varchar,
    latitude varchar,
    longitude varchar)"

psql -U oryx -d debian_db -p 5432 -c "\COPY ecology.global_land_temperatures_by_major_city FROM 'GlobalLandTemperaturesByMajorCity.csv' WITH DELIMITER AS ',' CSV HEADER ENCODING 'UTF-8';"
rm GlobalLandTemperaturesByMajorCity.csv
