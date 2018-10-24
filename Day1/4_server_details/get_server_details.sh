#!/usr/bin/env bash

export config=~/.scalr/default.yaml
export serverId=$1

scalr-ctl servers get --serverId $serverId
