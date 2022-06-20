FROM centos:centos7

USER root

RUN yum -y install openssh-server

RUN useradd remote_user && \
echo "1234" | passwd remote_user  --stdin && \
mkdir /home/remote_user/.ssh && \
chmod 700 /home/remote_user/.ssh

COPY remote-key.pub /home/remote_user/.ssh/authorized_keys

RUN chown remote_user:remote_user   -R /home/remote_user && \
chmod 600 /home/remote_user/.ssh/authorized_keys

RUN /usr/sbin/sshd-keygen > /dev/null 2>&1

RUN yum-config-manager --add-repo https://download.docker.com/linux/centos/docker-ce.repo 

RUN yum -y install yum-utils && \
    yum -y install device-mapper-persistent-data && \
    yum -y install lvm2 && \
    yum -y install mysql && \
    yum -y install docker  && \
    yum -y install epel-release 

RUN yum -y install python3-pip 

RUN pip3 install awscli && \
    pip3 install docker compose

CMD /usr/sbin/sshd -D 

