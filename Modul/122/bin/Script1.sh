#!/bin/bash

# Konfiguration des Skripts

cwd=`pwd`		# current working directory
cd `dirname $0`	# change to the directory where the script is located
BINDIR=`pwd`	# BINDIR: the directory where the script is located
cd $cwd		# return to the working directory
ETCDIR=$BINDIR/../etc

source $ETCDIR/conf1.conf		# run is the config directory

#Log
log(){
  DATE=`date '+%Y.%m.%d %H:%M:%S'`
  echo "$DATE:$*" >> $logs/log2
}


# Hauptskript
# Check for new alert files in the specified directory
shopt -s nullglob
for alert_file in $newalert/*
do
    # Extract the customer ID from the alert file name
    customer_id=$(awk '/^SYSTEM:/ {print $2}' $alert_file )

    subject=$(awk '/^SUBJECT:/ {print $2}' $alert_file )

    # Search for the customer data in the CSV file
    customer_data=$(grep $customer_id $csvkunden | sed 's/,/ /g')

    # Call script 2 with the customer data and alert file path
    $BINDIR/Script2.sh $alert_file $customer_data "$subject"

    # Check the return code of script 2
    if [ $? -eq 0 ]; then
        # Move the alert file to the done directory
        mv "$alert_file" "$donealert"
    else
        echo "Error: script 2 failed to execute on $BINDIR"
        mv "$alert_file" "$error"
    fi
done


