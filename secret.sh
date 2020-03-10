#!/bin/bash
echo  "Type variable hit enter: ";
read  secret
encryname=$(echo -n $secret | base64) 
echo $encryname
echo  "use http or https localhost/"$encryname

echo "PLEASE ADD THE TOKEN INTO THE docker-compose.yml"
