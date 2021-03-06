#!/bin/bash



cd /opt


if [ "$1" = "" ]; then
	JAVA_HOME="/opt/jdk"
else
	JAVA_HOME="$1"

fi

if [ ! -f "/opt/jdk-8u201-linux-x64.tar.gz" ]; then
	echo 'jdk 安装包不存在，准备下载'
	#wget --no-check-certificate --no-cookies --header "Cookie: oraclelicense=accept-securebackup-cookie" http://download.oracle.com/otn-pub/java/jdk/8u162-b12/0da788060d494f5095bf8624735fa2f1/jdk-8u201-linux-x64.tar.gz
	curl -OL  "https://download.oracle.com/otn-pub/java/jdk/8u201-b09/42970487e3af4f5aa5bca3f542482c60/jdk-8u201-linux-x64.tar.gz" -H "Cookie: oraclelicense=accept-securebackup-cookie"  -H "Connection: keep-alive" 
	tar -zxvf  jdk-8u201-linux-x64.tar.gz
else
	echo 'jdk 安装包已存在，准备执行解压操作.....'
	tar -zxvf  jdk-8u201-linux-x64.tar.gz
fi


rm -rf jdk
ln -s jdk1.8.0_201 jdk

echo -e "\n
#jdk config
export JAVA_HOME="$JAVA_HOME"
export JRE_HOME="$JAVA_HOME/jre"
export CLASSPATH=.:${JAVA_HOME}/lib:${JRE_HOME}/lib
export PATH=${JAVA_HOME}/bin:$PATH" >> /etc/profile

source /etc/profile

echo "JDK 安装成功，安装目录：$JAVA_HOME，JDK版本：`java -version`"
