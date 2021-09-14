#!/bin/bash

../generate-jenkins-agent-ssh-key.sh 

docker-compose build

docker-compose up -d
