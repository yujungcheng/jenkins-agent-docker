FROM centos:8

RUN yum -y install java openssh-server 
RUN useradd jenkins && \
    echo "jenkins:jenkins-password" | chpasswd && \
    mkdir /home/jenkins/.ssh && \
    chmod 700 /home/jenkins/.ssh

COPY ./jenkins_agent_key.pub /home/jenkins/.ssh/authorized_keys

RUN chown jenkins:jenkins -R /home/jenkins/.ssh && \
    chmod 600 /home/jenkins/.ssh/authorized_keys

RUN rm /run/nologin
RUN ssh-keygen -A

CMD /usr/sbin/sshd -D
