FROM centos:centos7

# Install Essentials
RUN yum update -y && \
    yum clean all

# Install Packages
RUN yum install -y git && \
    yum install -y wget && \
	yum install -y java-1.8.0-openjdk && \
	yum install -y sudo && \
	yum clean all

ARG user=jenkins
ARG group=jenkins
ARG uid=1000
ARG gid=1000

ENV JENKINS_HOME /home/${user}

# Jenkins is run with user `jenkins`, uid = 1000
RUN groupadd -g ${gid} ${group} \
    && useradd -d "$JENKINS_HOME" -u ${uid} -g ${gid} -m -s /bin/bash ${user}

RUN chown -R ${user}:${user} /home/${user}

# Add the jenkins user to sudoers
RUN echo "${user}    ALL=(ALL)    ALL" >> etc/sudoers

# Install Maven
RUN wget http://mirror.metrocast.net/apache/maven/maven-3/3.6.0/binaries/apache-maven-3.6.0-bin.tar.gz -P /tmp
RUN tar xvf /tmp/apache-maven-3.6.0-bin.tar.gz
RUN mv /tmp/apache-maven-3.6.0 /opt/maven

# Install Ant

RUN wget http://mirror.metrocast.net/apache//ant/binaries/apache-ant-1.10.5-bin.tar.gz -P /tmp
RUN tar xvf /tmp/apache-ant-1.10.5-bin.tar.gz
RUN mv /tmp/apache-ant-1.10.5 /opt/ant
RUN ln -s /opt/ant/bin/ant /usr/bin/ant

# Add environment variables
ADD env.sh /etc/profile.d/env.sh
RUN chmod +x /etc/profile.d/env.sh

