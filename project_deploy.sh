#!/bin/bash

pid=`sudo netstat -anp | grep 8080 | grep -oE "[0-9]+/java" | grep -oE "[0-9]+"`

if [ "$pid" != "" ]; then
        kill -9 $pid
fi

export JAVA_HOME=/opt/jdk/
export JRE_HOME=$JAVA_HOME/jre
export CLASSPATH=$JAVA_HOME/lib:$JRE_HOME/lib:$CLASSPATH
export PATH=$JAVA_HOME/bin:$JRE_HOME/bin:$PATH


cd /develop/job-crawler/
git pull

nohup mvn spring-boot:run -Dmaven.test.skip=true -Dspring.profiles.active=prod  &
