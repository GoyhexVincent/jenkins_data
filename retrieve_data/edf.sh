

wget --output-document=nuclear_reactors_dataset.csv https://www.data.gouv.fr/fr/datasets/r/6e15f43d-35ae-407a-b322-cc3bc93a4959
psql -U vgoyhex -d localhost -p 5432 -c "CREATE SCHEMA IF NOT EXISTS energie;"
psql -U vgoyhex -d localhost -p 5432 -c "DROP TABLE IF EXISTS energie.nuclear_reactors_dataset;"
psql -U vgoyhex -d localhost  -p 5432 -c "CREATE TABLE energie.nuclear_reactors_dataset(
    nom_du_reacteur varchar PRIMARY KEY NOT NULL,
    centrale_nucleaire varchar,
    commune varchar,
    Lat float,
    long float,
    departement varchar,
    rg varchar,
    palier varchar,
    puissance_thermique varchar,
    puissance_brute varchar,
    puissance_nette varchar,
    debut_construction smallint,
    raccordement_au_reseau smallint,
    mise_en_service smallint);"
psql -U vgoyhex -d localhost -p 5432 -c "\COPY energie.nuclear_reactors_dataset FROM 'nuclear_reactors_dataset.csv' WITH DELIMITER AS ',' CSV HEADER ENCODING 'WIN1252';"
rm nuclear_reactors_dataset.csv
