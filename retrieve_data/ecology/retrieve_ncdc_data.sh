#!/bin/bash
rm -rf ncdc_data

'The following wget command allows you to download everything from 20150101 to 20171231'
echo 'Feel free to change the settings according to your needs: {starting_year..ending_year}{starting_month..ending_month}{starting_day..ending_day}'
mkdir ncdc_data

wget -P ./ncdc_data ftp://ftp.ncdc.noaa.gov/pub/data/ghcn/daily/by_year/{1763..2018}.csv.gz
wget -P ./ncdc_data ftp://ftp.ncdc.noaa.gov/pub/data/ghcn/daily/by_year/readme.txt

cd ./ncdc_data
array=($(ls))

echo ls

for i in  "${array[@]}"
do
        echo "$i"
        unzip $i
        rm $i
done
cd ../
#rm -rf gdelt_data

