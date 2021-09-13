#!/bin/bash

if [ "$1" == "" ]; then
  PORT=2200
else
  PORT=${1}
fi

if [ "$2" != "" ]; then
  CMD=${2}
fi

KEY='./jenkins_agent_key'
USER='jenkins'
IP='127.0.0.1'

# ssh to jenkins agent container
ssh ${USER}@${IP} -p ${PORT} -i ${KEY} -oStrictHostKeyChecking=no ${CMD}
