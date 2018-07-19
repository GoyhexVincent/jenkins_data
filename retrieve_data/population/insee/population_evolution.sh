#https://www.insee.fr/fr/statistiques/2521169

wget --output-document=bdd_comparateur_territoires.zip https://www.insee.fr/fr/statistiques/fichier/2521169/base_cc_comparateur.zip
unzip bdd_comparateur_territoires.zip
rm -rf bdd_comparateur_territoires.zip


python insee_xls_to_csv.py

#rm base_cc_comparateur.xls

#psql -U vgoyhex -d localhost -p 5432 -c "CREATE SCHEMA IF NOT EXISTS population;"
#psql -U vgoyhex -d localhost -p 5432 -c "DROP TABLE IF EXISTS population.insee_comparateur_territoires_2018;"
#psql -U vgoyhex -d localhost  -p 5432 -c "CREATE TABLE population.insee_comparateur_territoires_2018(
#    nom_du_reacteur varchar PRIMARY KEY NOT NULL,
#    centrale_nucleaire varchar,
#    commune varchar,
#    Lat float,
#    long float,
#    departement varchar,
#    rg varchar,
#    palier varchar,
#    puissance_thermique varchar,
#    puissance_brute varchar,
#    puissance_nette varchar,
#    debut_construction smallint,
#    raccordement_au_reseau smallint,
#    mise_en_service smallint);"
#psql -U vgoyhex -d localhost -p 5432 -c "\COPY energie.nuclear_reactors_dataset FROM 'nuclear_reactors_dataset.csv' WITH DELIMITER AS ',' CSV HEADER ENCODING 'WIN1252';"
#rm nuclear_reactors_dataset.csv





