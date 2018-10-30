#!/bin/bash
export config=~/.scalr/default.yaml
export farmId=$1
export newfarmname=$2

# clone farm
scalr-ctl farms clone --name $newfarmname --farmId $farmId
