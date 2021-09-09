# Jenkins Agent Docker

## Jenkins Agent docker build & run toolsr
Scripts to run a Jenkins Agent in Docker.

## Required current user to execute docker command
usermod -aG docker <username>

## scripts
```sh
- build-ubuntu-jenkins-agent-image.sh    # build jenkins agent image base on ubuntu 20.04
  arguments: <keyname>
- generate-jenkins-agent-ssh-key.sh    # generate ssh key pair
  arguments: <keyname>
- run-jenkins-ssh-agent-docker.sh    # launch jenkins agent docker container
  arguments: <keyname> <portnumber> <imagename>
- ssh-to-jenkins-agent-docker.sh    # ssh to the container 
  arguments: <host port>
- clean-jenkins-agent-none-image.sh    # clean repository <none> images
- clean-jenkins-agent-ssh-key.sh    # remove key file in current directory.
```

# Note
For "jenkins/ssh-agent" docker image, java is located in /opt/java/openjdk/bin/java
When add slave node in Jenkins, specify it in "JavaPath"

## Reference
https://www.jenkins.io/doc/book/using/using-agents/

## Contributing
Pull requests are welcome. For major changes, please open an issue first to
discuss what you would like to change.
Please make sure to update tests as appropriate.

## License
Apache License 2.0
