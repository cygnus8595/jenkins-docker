#!/bin/bash
ANT_HOME=/opt/ant
MAVEN_HOME=/opt/maven
M2_HOME=/opt/maven
M2=$M2_HOME/bin
MAVEN_OPTS=-Xms256m -Xmx512m
JAVA_HOME=/usr/lib/jvm/java-1.8.0-openjdk-1.8.0.191.b12-1.el7_6.x86_64
GROOVY_HOME=/opt/groovy/groovy-2.5.6
PATH=$ANT_HOME/bin:/opt/maven/bin:/opt/gradle/gradle-5.2.1/bin:$GROOVY_HOME/bin:/usr/local/lib/nodejs/node-v10.15.1-linux-x64/bin:$PATH

export PATH ANT_HOME MAVEN_HOME M2_HOME MAVEN_OPTS JAVA_HOME GROOVY_HOME
export CLASSPATH=.
