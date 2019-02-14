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
RUN tar xvf /tmp/apache-maven-3.6.0-bin.tar.gz -C /tmp && mv /tmp/apache-maven-3.6.0 /opt/maven

# Install Ant

RUN wget http://mirror.metrocast.net/apache//ant/binaries/apache-ant-1.10.5-bin.tar.gz -P /tmp
RUN tar xvf /tmp/apache-ant-1.10.5-bin.tar.gz -C /tmp && mv /tmp/apache-ant-1.10.5 /opt/ant
RUN ln -s /opt/ant/bin/ant /usr/bin/ant

# Install Gradle

RUN mkdir -p /opt/gradle && wget https://downloads.gradle.org/distributions/gradle-5.2.1-bin.zip -P /tmp
RUN unzip -d /opt/gradle /tmp/gradle-5.2.1-bin.zip

# Install Groovy

RUN wget https://bintray.com/artifact/download/groovy/maven/apache-groovy-binary-2.5.6.zip -P /tmp
RUN mkdir -p /opt/groovy && unzip -d /opt/groovy /tmp/apache-groovy-binary-2.5.6.zip

# Install NodeJS

RUN wget https://nodejs.org/dist/v10.15.1/node-v10.15.1-linux-x64.tar.xz -P /tmp
RUN mkdir -p /usr/local/lib/nodejs && tar -xJvf /tmp/node-v10.15.1-linux-x64.tar.xz -C /usr/local/lib/nodejs

# Add environment variables
ADD env.sh /etc/profile.d/env.sh
RUN chmod +x /etc/profile.d/env.sh

