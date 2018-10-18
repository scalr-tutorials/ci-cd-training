#!/usr/bin/env bash

export config=~/.scalr/default.yaml
export farmId=$1
export jsonfile=$2

# add farm role
scalr-ctl farm-roles create --farmId $farmId --stdin < $jsonfile
