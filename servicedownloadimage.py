import os
import csv
import urllib.request
import os.path

folder = os.path.expanduser("~/Downloads")

## Arquivo CSV contendo URL e Novo Nome do arquivo
FILE_NAME = folder + "/images.csv"
DELIMITER_FILE = ","

def serviceDownload():
    if (not os.path.exists(FILE_NAME)):
        print("FILE CSV NOT FOUND")
        return
    
    reader = csv.reader(
        open(FILE_NAME, 'r'),
        delimiter=DELIMITER_FILE
    )

    for row in reader:
        urllib.request.urlretrieve(row[1], folder +  "/" + row[0]+".jpg")
        print(row[0])

serviceDownload()