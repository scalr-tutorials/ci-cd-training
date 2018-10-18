#!/usr/bin/env bash

export config=~/.scalr/default.yaml
export projectid=$2
export farmname=$1

#make folder to hold jsonfiles
mkdir -p ./json

# create farm teamplates
cat farm_template.json | jq '.project.id=env.projectid' | jq '.description=env.farmname' | jq '.name=env.farmname' | jq '.timezone="America\/Chicago"' > ./json/$farmname.json

# create the farms
export farmid=`scalr-ctl --config $config farms create-from-template --stdin < ./json/$farmname.json | jq '.data.id'`
echo $farmid
scalr-ctl --config $config farms launch --farmId $farmid
