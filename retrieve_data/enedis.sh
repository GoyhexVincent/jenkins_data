
wget --output-document=enedis_daily_client_consumption_dataset.csv https://www.data.gouv.fr/fr/datasets/r/7436a625-9b0d-4a5a-a124-3b9da68fbfe3
psql -U vgoyhex -d localhost -p 5432 -c "CREATE SCHEMA IF NOT EXISTS energie;"
psql -U vgoyhex -d localhost -p 5432 -c "DROP TABLE IF EXISTS energie.enedis_daily_client_consumption_dataset;"
psql -U vgoyhex -d localhost  -p 5432 -c "CREATE TABLE energie.enedis_daily_client_consumption_dataset(
    date varchar, 
    categorie_client varchar,
    puissance_moyenne_journaliere float);"
psql -U vgoyhex -d localhost -p 5432 -c "\COPY energie.enedis_daily_client_consumption_dataset FROM 'enedis_daily_client_consumption_dataset.csv' WITH DELIMITER AS ';' CSV HEADER ENCODING 'WIN1252';"
rm enedis_daily_client_consumption_dataset.csv
