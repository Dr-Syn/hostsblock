#!/bin/bash
# Mangler to take blocklist from basic format to unbound format
rm /etc/hosts.blacklist
touch /etc/hosts.blacklist
DATA=`cut -d " " -f 2 /etc/hosts.block | tr '[:upper:]' '[:lower:]' | sed -nr '/[.].*[a-zA-Z0-9][a-zA-Z0-9-]+([.][a-zA-Z]{2,15})?$/p' | sort -nr | uniq`
# Get the second column. Convert to lowercase. Get rid of invalid domains. Sort. Get rid of duplicates.
for i in $DATA ;
do
	 printf "local-zone: \"%s\" redirect\nlocal-data: \"%s A 127.0.0.1\"\n" $i $i >> /etc/hosts.blacklist
done
