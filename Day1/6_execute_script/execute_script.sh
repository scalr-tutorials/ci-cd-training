#!/usr/bin/env bash

export config=~/.scalr/default.yaml
export scriptId=$1
export serverId=$2

# execute Script on Server
scalr-ctl scripts execute --scriptId $scriptId --serverId $serverId
