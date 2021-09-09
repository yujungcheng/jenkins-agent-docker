#!/bin/bash

if [ "$1" == "" ]; then
  keyname='./jenkins_agent_key'
else
  keyname=${1}
fi
echo "$(date): keyname=${keyname}"

# clean exist key
if [ -f ${keyname} ]; then
  echo "$(date): remove key ${keyname}"
  rm -r ${keyname} ${keyname}.pub
  
  # or just move key a backup
  #mv ${keyname} ${keyname}.old
  #mv ${keyname}.pub ${keyname}.pub.old
fi
