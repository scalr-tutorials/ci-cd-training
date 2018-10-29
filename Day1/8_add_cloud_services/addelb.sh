#!/bin/bash


export config=~/.scalr/default.yaml
export farmId=$1
export jsonfile=$2

#make folder to hold jsonfiles
mkdir -p ./json

# link cloud services(ELB)
scalr-ctl farm-cloud-services create --farmId $farmId --stdin < ./json/$jsonfile
