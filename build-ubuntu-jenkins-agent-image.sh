#!/bin/bash

tag='ubuntu2004/jenkins_agent'

docker build -rm -t ${tag} .
