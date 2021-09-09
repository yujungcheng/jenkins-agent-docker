#!/bin/bash

if [ "$1" == "" ]; then
  keyname='jenkins_agent_key'
else
  keyname=${1}
fi
echo "$(date): keyname=${keyname}"

# backup exist key
if [ -f ${keyname} ]; then
  echo "$(date): backup exist key"
  mv ${keyname} ${keyname}.old
  mv ${keyname}.pub ${keyname}.pub.old
fi

# generate key
echo "$(date): generate new key"
ssh-keygen -q -t rsa -N '' -f ${keyname}

# simulate type y and enter. (not working)
#ssh-keygen -q -t rsa -N '' -f ${keyname} <<< ""$'\n'"y" 2>&1 >/dev/null
