#!/bin/bash
wget2 --timeout=20 --spider -r ${1} |  grep "Adding URL:" | cut -d " " -f 3 | tee ${1}.txt
echo "Localizando subdominios"
URLS=$(cat ${1}.txt | grep -oP "\b([a-zA-Z0-9-]+\.)+${1}\b")
for i in $URLS; do wget2 --tries=1 --connect-timeout=10 --read-timeout=10 --timeout=20 --spider -r ${i} | grep "Adding URL:" | cut -d " " -f 3 | tee ${1}_full.txt; done
