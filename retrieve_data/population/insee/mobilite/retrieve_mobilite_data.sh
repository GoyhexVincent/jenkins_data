#!/bin/bash
#https://www.insee.fr/fr/statistiques/3558417


wget --output-document=mobilite_professionnelles.zip https://www.insee.fr/fr/statistiques/fichier/3566008/rp2015_mobpro_txt.zip
wget --output-document=dico_variables.pdf https://www.insee.fr/fr/statistiques/fichier/3566008/contenu_rp2015_mobpro.pdf
unzip mobilite_professionnelles.zip
rm -rf mobilite_professionnelles.zip

psql -d debian_db -h localhost -c "CREATE SCHEMA IF NOT EXISTS population;"
psql -d debian_db -h localhost -c "DROP TABLE IF EXISTS population.mobilites_professionnelles_insee_2015;"
psql -d debian_db -h localhost -c "CREATE TABLE population.mobilites_professionnelles_insee_2015 (commune varchar, arrondissement varchar, dcflt varchar, dclt varchar, agerevq varchar, cs1 varchar, derou varchar, dipl_15 varchar, empl varchar, ilt varchar, iltuu varchar, immi varchar, inatc varchar,ineem varchar, inpom varchar, inpsm varchar, ipondi varchar, lprm varchar, metrodom varchar, moco varchar, na5 varchar, nperr varchar, region varchar,reglt varchar, sexe varchar, stat varchar, stocd varchar, tp varchar, trans varchar,typl varchar,  typmr varchar, voit varchar)"

psql -U oryx -d debian_db -p 5432 -c "\COPY population.mobilites_professionnelles_insee_2015 FROM 'FD_MOBPRO_2015.txt' WITH DELIMITER AS ';' CSV HEADER ENCODING 'UTF-8';"
rm FD_MOBPRO_2015.txt MOD_MOBPRO_2015.txt






