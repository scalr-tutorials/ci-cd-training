#!/usr/bin/env bash

export config=~/.scalr/default.yaml
export farmRoleId=$1

# Launch Server
scalr-ctl servers launch --farmRoleId $farmRoleId
