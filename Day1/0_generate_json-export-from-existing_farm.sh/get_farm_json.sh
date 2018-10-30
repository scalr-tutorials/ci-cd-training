#!/usr/bin/env bash

export config=~/.scalr/default.yaml
export farmId=$1
export farmName=$2

# generate farm role
scalr-ctl farms generate-template --farmId $farmId >> $farmName.json
