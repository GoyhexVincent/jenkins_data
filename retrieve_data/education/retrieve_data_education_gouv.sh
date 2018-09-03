#!/bin/bash
psql -U oryx -d debian_db -p 5432 -c "CREATE SCHEMA IF NOT EXISTS education;"



###########################################################################################################################################################################
###########################################################################################################################################################################
#Effectifs d'élèves des établissements du premier degré public et privé sous tutelle du ministère en charge de l'éducation nationale

wget -O "effectifs_premier_degre.csv" "https://data.education.gouv.fr/explore/dataset/fr-en-effectifs-premier-degre/download/?format=csv&timezone=Europe/Berlin&use_labels_for_header=true"

psql -U oryx -d debian_db -p 5432 -c "DROP TABLE IF EXISTS education.effectifs_premier_degre;"
psql -U oryx -d debian_db  -p 5432 -c "CREATE TABLE education.effectifs_premier_degre(
    annee_scolaire varchar,
    numero_ecole varchar,
    academie varchar,
    type_ecole varchar,
    secteur_enseignement varchar,
    nombre_eleves integer,
    libelle_region varchar,
    code_region varchar,
    code_departement varchar,
    departement varchar);"

psql -U oryx -d debian_db -p 5432 -c "\COPY education.effectifs_premier_degre FROM 'effectifs_premier_degre.csv' WITH DELIMITER AS ';' CSV HEADER ENCODING 'UTF-8';"
rm fr_effectifs_premier_degre.csv

#Effectifs d'élèves des établissements du second degré public et privé sous tutelle du ministère en charge de l'éducation nationale

wget -O "effectifs_second_degre.csv" "https://data.education.gouv.fr/explore/dataset/fr-en-effectifs-second-degre/download/?format=csv&timezone=Europe/Berlin&use_labels_for_header=true"
psql -U oryx -d debian_db -p 5432 -c "DROP TABLE IF EXISTS education.effectifs_second_degre;"
psql -U oryx -d debian_db  -p 5432 -c "CREATE TABLE education.effectifs_second_degre(
    annee_scolaire varchar,
    numero_ecole varchar,
    academie varchar,
    type_ecole varchar,
    secteur_enseignement varchar,
    nombre_eleves integer,
    libelle_region varchar,
    code_region varchar,
    code_departement varchar,
    departement varchar);"

psql -U oryx -d debian_db -p 5432 -c "\COPY education.effectifs_second_degre FROM 'effectifs_second_degre.csv' WITH DELIMITER AS ';' CSV HEADER ENCODING 'UTF-8';"
rm fr_effectifs_second_degre.csv

###########################################################################################################################################################################
###########################################################################################################################################################################
# Adresse et géolocalisation des établissements d'enseignement du premier et second degrés
#GEOSPATIAL DATA included 


wget -O "adresse_etablissements_enseignement_premier_second_degre.csv" "https://data.education.gouv.fr/explore/dataset/fr-en-adresse-et-geolocalisation-etablissements-premier-et-second-degre/download/?format=csv&timezone=Europe/Berlin&use_labels_for_header=true"


psql -U oryx -d debian_db -p 5432 -c "DROP TABLE IF EXISTS education.adresse_etablissements_enseignement_premier_second_degre;"
psql -U oryx -d debian_db  -p 5432 -c "CREATE TABLE education.adresse_etablissements_enseignement_premier_second_degre(
    code_etablissement varchar,
    nom_officiel varchar,
    nom_principal varchar,
    patronyme_uai varchar,
    secteur_enseignement varchar,
    adresse varchar,
    lieu_dit varchar,
    boite_postale varchar,
    code_postal integer,
    localite_acheminement varchar,
    commune varchar,	
    coord_x float,
    coord_y float,
    latitude float,
    longitude float,
    qualite_appariement varchar,
    localisation varchar,
    code_nature integer, 
    nature varchar,
    code_etat_etablissement integer,
    etat_etablissement varchar,
    code_departement varchar,
    code_region varchar,
    code_academie varchar,
    code_commune varchar,
    departement varchar,
    region varchar,
    academie varchar,
    position varchar);"

psql -U oryx -d debian_db -p 5432 -c "\COPY education.adresse_etablissements_enseignement_premier_second_degre FROM 'adresse_etablissements_enseignement_premier_second_degre.csv' WITH DELIMITER AS ';' CSV HEADER ENCODING 'UTF-8';"
rm fr_effectifs_premier_degre.csv


###########################################################################################################################################################################
###########################################################################################################################################################################
#Effectifs des personnels des écoles du 1er degré et des établissements du 2nd degré 

wget -O "effectifs_personnel_ecoles_premier_second_degre.csv" "https://data.education.gouv.fr/explore/dataset/fr-en-effectifs-des-personnels-des-ecoles-et-etablissements-du-2nd-degre/download/?format=csv&timezone=Europe/Berlin&use_labels_for_header=true"

psql -U oryx -d debian_db -p 5432 -c "DROP TABLE IF EXISTS education.effectifs_personnel_ecoles_premier_second_degre;"
psql -U oryx -d debian_db  -p 5432 -c "CREATE TABLE education.effectifs_personnel_ecoles_premier_second_degre(
    annee_scolaire varchar,
    numero_etablissement varchar,
    type_etablissement varchar,
    secteur_enseignement varchar,
    academie varchar,
    groupe_de_personnels varchar,
    titulaire varchar,
    sexe varchar,
    tranche_age_min integer,
    tranche_age_max integer,
    nombre_agents integer,
    code_region varchar,
    code_departement varchar,
    localite_acheminement varchar,
    code_academie varchar,
    departement varchar,
    region varchar);"

psql -U oryx -d debian_db -p 5432 -c "\COPY education.effectifs_personnel_ecoles_premier_second_degre FROM 'effectifs_personnel_ecoles_premier_second_degre.csv' WITH DELIMITER AS ';' CSV HEADER ENCODING 'UTF-8';"
rm effectifs_personnel_ecoles_premier_second_degre.csv



