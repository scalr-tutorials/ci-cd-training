#!/usr/bin/env bash

export config=~/.scalr/default.yaml
export farmId=$1
export jsonfile=$2

#make folder to hold jsonfiles
mkdir -p ./json

# update Farm
scalr-ctl farms update --farmId $farmId --stdin < ./json/$jsonfile
