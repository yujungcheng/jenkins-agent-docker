#!/bin/bash

# make sure current user is in docker group 
# to allow launch docker container
# 
# - add user to docker group
#   $ sudo usermod -aG docker <username>
# - show current user group
#   $ groups 
#
# arguments: <keyname> <portnumber> <imagename>
# use default value if no arguments

if [ "$#" == "3" ]; then
  keyname=${1}
  hostport=${2}
  imagename="${3}"
else
  keyname='jenkins_agent_key'
  hostport=2200
  imagename="jenkins/ssh-agent:alpine"
fi
echo "$(date): keyname=${keyname}"
echo "$(date): hostport=${hostport}"
echo "$(date): imagename=${imagename}"

containername="jenkins_agent_${hostport}"
echo "$(date): container_name=${containername}"

jenkins_pub_key=$(cat ${keyname}.pub)

echo "$(date): launch container ${containername}"
docker run -d --name ${containername} -p ${hostport}:22 \
	-e "JENKINS_AGENT_SSH_PUBKEY=${jenkins_pub_key}" \
	${imagename}

sleep 1
docker ps -f name=${containername}

