#!/bin/bash
#this needs to be setup on the jenkins server
export config=/etc/jenkins_jobs/dev-app1.yml
export FName=$JOB_NAME-$GIT_BRANCH-$GIT_COMMIT
export farm_template=apache.json
export app_farm_template=web-server.json

# Create farm and get ID
cat $app_farm_template| jq '.farm.name=env.FName' > $farm_template
export farmid=`scalr-ctl --config $config farms create-from-template --stdin < $farm_template | jq '.data.id'`
echo $farmid

# launch farm
scalr-ctl --config $config farms launch --farmId $farmid

#give scalr time to kick off
sleep 60

# get server id
scalr-ctl --config $config farms list-servers --farmId $farmid
export serverid=`scalr-ctl --config $config farms list-servers --farmId $farmid | jq '.data[0].id'|tr -d '"'`
export orchserverid='"'$serverid'"'

echo $serverid
echo $orchserverid

# loop till the server is up and running
while [ "$serverstatus" != "running" ]
 do echo "Status: $serverstatus"
	export serverstatus=`scalr-ctl --config $config servers get --serverId $serverid | jq '.data.status'| tr -d '"'`
	sleep 10
done

# let logs run
sleep 30

# get orchestration log id
export orchlogid=`scalr-ctl --config $config scripts list-orchestration-logs | jq ".data[] | select(.server.id | contains($orchserverid)).id"| sed "s/\"//g"`

# get orchestration logs
scalr-ctl --config $config scripts get-orchestration-log --logEntryId $orchlogid | jq '.'

# verify exit code
if [ `scalr-ctl --config $config scripts get-orchestration-log --logEntryId $orchlogid | jq '.data.executionExitCode'` != 0 ]
 then
 exit 1
fi

# clean up
scalr-ctl --config $config farms terminate --farmId $farmid

# loop till the server has been terminated
while [ "$serverstatus" != "terminated" ]
 do echo "Status: $serverstatus"
	export serverstatus=`scalr-ctl --config $config servers get --serverId $serverid | jq '.data.status'| tr -d '"'`
	sleep 10
done

# delete farm
scalr-ctl --config $config farms delete --farmId $farmid
