FROM ubuntu:20.04

ARG user=jenkins
ARG JENKINS_AGENT_HOME=/home/${user}
ENV JENKINS_AGENT_HOME ${JENKINS_AGENT_HOME}

RUN apt update
RUN apt install openssh-server -y
RUN apt install software-properties-common apt-transport-https -y
RUN add-apt-repository ppa:openjdk-r/ppa -y

RUN apt install openjdk-8-jdk -y && java -version

RUN useradd -m -s /bin/bash ${user}
RUN usermod --password "jenkinspassword" ${user}

RUN echo "export PATH=${PATH}" >> /etc/profile
EXPOSE 22

COPY ./start.sh /
CMD ["/start.sh"]
