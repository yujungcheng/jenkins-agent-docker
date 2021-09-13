#!/bin/bash

if [ "${1}" == "" ]; then
  tag='ubuntu2004/jenkins_agent:latest'
else
  tag=${1}
fi

docker build --rm -t ${tag} .
