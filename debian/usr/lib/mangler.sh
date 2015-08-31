#!/bin/bash
# Mangler to take blocklist from basic format to unbound format
rm /etc/hosts.blacklist
touch /etc/hosts.blacklist
DATA=`cut -f 2 /etc/hosts.block`
for i in $DATA ;
do
	 printf "local-zone: \" %s\" redirect\nlocal-data: \"%s A 127.0.0.1\"\n" $i $i >> /etc/hosts.blacklist
done
