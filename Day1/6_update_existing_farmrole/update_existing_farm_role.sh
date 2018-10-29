#!/usr/bin/env bash

export config=~/.scalr/default.yaml
export farmroleId=$1
export jsonfile=$2

#make folder to hold jsonfiles
mkdir -p ./json

# update FarmRole
scalr-ctl farm-roles update --farmRoleId $farmroleId --stdin < ./json/$jsonfile
