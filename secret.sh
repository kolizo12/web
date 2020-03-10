#!/bin/bash
read secret
encryname=$(echo -n $secret | base64) 
echo $encryname
