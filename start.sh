#!/bin/bash

# start script for running ubuntu docker container with sshd

write_key() {
  local ID_GROUP

  # As user, group, uid, gid and JENKINS_AGENT_HOME can be overridden at build,
  # we need to find the values for JENKINS_AGENT_HOME
  # ID_GROUP contains the user:group of JENKINS_AGENT_HOME directory
  ID_GROUP=$(stat -c '%U:%G' "${JENKINS_AGENT_HOME}")

  mkdir -p "${JENKINS_AGENT_HOME}/.ssh"
  echo "$1" > "${JENKINS_AGENT_HOME}/.ssh/authorized_keys"
  chown -Rf "${ID_GROUP}" "${JENKINS_AGENT_HOME}/.ssh"
  chmod 0700 -R "${JENKINS_AGENT_HOME}/.ssh"
}


echo "config public key"
if [[ ${JENKINS_AGENT_SSH_PUBKEY} == ssh-* ]]; then
  write_key "${JENKINS_AGENT_SSH_PUBKEY}"
fi
env | grep _ >> /etc/environment


echo "start ssh server"
/etc/init.d/ssh start


# generate host key
ssh-keygen -A


# sleep forever
while true; do
  echo "sleep 3600"
  sleep 3600
done


