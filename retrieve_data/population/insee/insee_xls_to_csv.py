import pandas as pd

newFile = pd.ExcelFile('/home/vgoyhex/local_server/jenkins_data/retrieve_data/population/insee/base_cc_comparateur.xls', header=None, encoding='utf-8')
df = newFile.parse("COM")
a= df.values
a = a[:4]
df.to_csv('insee_comparateur_territoires_2018.csv', sep=';', encoding='utf-8')
