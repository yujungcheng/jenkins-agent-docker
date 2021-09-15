#!/bin/bash

container_name="jenkins_ansible"
mkdir -p ./jenkins_home

docker-compose up -d

docker exec -u 0 ${container_name} apt update
docker exec -u 0 ${container_name} apt install -y python3 python3-pip
docker exec -u 0 ${container_name} pip3 install ansible --upgrade
docker exec -u 0 ${container_name} ansible --version

