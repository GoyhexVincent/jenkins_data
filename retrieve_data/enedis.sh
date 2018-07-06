#https://www.data.gouv.fr/fr/datasets/consommation-journaliere-par-categorie-client/
wget --output-document=enedis_daily_client_consumption.csv https://www.data.gouv.fr/fr/datasets/r/7436a625-9b0d-4a5a-a124-3b9da68fbfe3
psql -U vgoyhex -d localhost -p 5432 -c "CREATE SCHEMA IF NOT EXISTS energie;"
psql -U vgoyhex -d localhost -p 5432 -c "DROP TABLE IF EXISTS energie.enedis_daily_client_consumption;"
psql -U vgoyhex -d localhost  -p 5432 -c "CREATE TABLE energie.enedis_daily_client_consumption(
    date varchar, 
    categorie_client varchar,
    puissance_moyenne_journaliere float);"
psql -U vgoyhex -d localhost -p 5432 -c "\COPY energie.enedis_daily_client_consumption FROM 'enedis_daily_client_consumption.csv' WITH DELIMITER AS ';' CSV HEADER ENCODING 'WIN1252';"
rm enedis_daily_client_consumption.csv


#https://www.data.gouv.fr/fr/datasets/production-electrique-par-filiere-a-la-maille-epci/#_
wget --output-document=enedis_epci_electric_consumption.csv https://www.data.gouv.fr/fr/datasets/r/2b42530b-039d-458f-8b5f-af5824a41cf0

psql -U vgoyhex -d localhost -p 5432 -c "DROP TABLE IF EXISTS energie.enedis_epci_electric_consumption;"
psql -U vgoyhex -d localhost  -p 5432 -c "CREATE TABLE energie.enedis_epci_electric_consumption(
    date varchar, 
    nom_EPCI varchar,
    code_EPCI varchar,
    type_EPCI varchar,
    departement varchar,
    code_departement smallint,
    region varchar,
    code_region smallint,
    domaine_de_tension varchar,
    nb_sites_photovoltaiques_enedis smallint,
    energie_photovoltaique_annuelle_enedis float,
    nombre_sites_eoliens_enedis smallint,
    energie_eolienne_annuelle_enedis float,
    nombre_sites_hydrauliques_enedis smallint,
    energie_hydraulique_annuelle_enedis float,
    nombre_sites_bio_energie_enedis smallint,
    energie_bio_energie_enedis float,
    nombre_sites_cogeneration_enedis smallint,
    energie_cogeneree_annuelle_enedis float,
    nombre_sites_autres_filieres_enedis smallint,
    energie_autres_filieres_annuelle_enedis float,
    geo_shape varchar,
    geo_point_2d varchar
    );"
psql -U vgoyhex -d localhost -p 5432 -c "\COPY energie.enedis_epci_electric_consumption FROM 'enedis_epci_electric_consumption.csv' WITH DELIMITER AS ';' CSV HEADER ENCODING 'WIN1252';"
rm enedis_epci_electric_consumption.csv


#https://www.data.gouv.fr/fr/datasets/production-electrique-annuelle-par-filiere-a-la-maille-department/
wget --output-document=enedis_department_electric_consumption.csv https://www.data.gouv.fr/fr/datasets/r/86a578ea-9024-489c-8630-2dd14003ab54
psql -U vgoyhex -d localhost -p 5432 -c "DROP TABLE IF EXISTS energie.enedis_department_electric_consumption;"
psql -U vgoyhex -d localhost  -p 5432 -c "CREATE TABLE energie.enedis_department_electric_consumption(
    date varchar, 
    departement varchar,
    code_departement varchar,
    region varchar,
    code_region smallint,
    domaine_de_tension varchar,
    nb_sites_photovoltaiques_enedis smallint,
    energie_photovoltaique_annuelle_enedis float,
    nombre_sites_eoliens_enedis smallint,
    energie_eolienne_annuelle_enedis float,
    nombre_sites_hydrauliques_enedis smallint,
    energie_hydraulique_annuelle_enedis float,
    nombre_sites_bio_energie_enedis smallint,
    energie_bio_energie_enedis float,
    nombre_sites_cogeneration_enedis smallint,
    energie_cogeneree_annuelle_enedis float,
    nombre_sites_autres_filieres_enedis smallint,
    energie_autres_filieres_annuelle_enedis float,
    geo_shape varchar,
    geo_point_2d varchar
    );"
psql -U vgoyhex -d localhost -p 5432 -c "\COPY energie.enedis_department_electric_consumption FROM 'enedis_department_electric_consumption.csv' WITH DELIMITER AS ';' CSV HEADER ENCODING 'WIN1252';"
rm enedis_department_electric_consumption.csv






