#!/bin/bash
#IMPOSSIBLE DE FAIRE UN WGET sur le site de l'IGN :(, il faut télécharger le lien à la main comme un péon...
#https://www.data.gouv.fr/fr/datasets/admin-express/


psql -U oryx -d debian_db -p 5432 -c "CREATE SCHEMA IF NOT EXISTS admin;"
shp2pgsql -I -s 3857  ./ADE-COG_1-1_SHP_LAMB93_FR/COMMUNE_CARTO.shp admin.commune_2018 | psql -U oryx -p 5432 -h localhost -d debian_db
shp2pgsql -I -s 3857  ./ADE-COG_1-1_SHP_LAMB93_FR/CHEF_LIEU.shp admin.chef_lieu_2018 | psql -U oryx -p 5432 -h localhost -d debian_db
shp2pgsql -I -s 3857  ./ADE-COG_1-1_SHP_LAMB93_FR/DEPARTEMENT_CARTO.shp admin.departement_2018 | psql -U oryx -p 5432 -h localhost -d debian_db
shp2pgsql -I -s 3857  ./ADE-COG_1-1_SHP_LAMB93_FR/REGION_CARTO.shp admin.region_2018 | psql -U oryx -p 5432 -h localhost -d debian_db
shp2pgsql -I -s 3857  ./ADE-COG_1-1_SHP_LAMB93_FR/EPCI.shp admin.epci_2018 | psql -U oryx -p 5432 -h localhost -d debian_db





