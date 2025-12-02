#!/bin/bash

# API_KEY=CE1B6DFF55D283B9E2D00D02D4183285

#Konfiguration des Skripts
cwd="pwd" #current working directory
cd "dirname $0" #changes to script directory
BINDIR="pwd" #location of the script
cd $cwd	#return to working directory

ETCDIR=$BINDIR/../etc

source $ETCDIR/conf2.conf #selects config file

#Parameterüberprüfung

input_file=$1
system_name=$2
email=$3
phone_number=$4
subject=$5


#Hauptskript

## Überprüfung ob die benötigten Parameter übergeben wurden

if [ "$#" -eq 5 ]; then
    echo "Usage: $0 input_file system_name email phone_number subject"
else
    quit "Error: not enough parameters to create a json_file"
fi

##Json file wird mit den Parametern erstellt
echo "Json file wird erstellt"
jq -n
    --arg input "$input_file" \
    --arg system "$system_name" \
    --arg email "$email" \
    --arg phonenumber "$phone_number" \
    --arg subject "$subject" \
    
"{name: $system_name, alert: true, autorespond:true, source: "API" ,email: $email, phone: $phone_number, subject: $subject}" > $json_file

## Ausführen des Json files via API_Key
echo "json file wird mit dem API-Key ausgeführt"
curl -d "{$json_file}" -H "X-API-Key: CE1B6DFF55D283B9E2D00D02D4183285"
    http://10.2.42.25/api/tickets.json