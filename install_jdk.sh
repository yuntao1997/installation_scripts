#!/bin/bash



cd /opt


if [ $1 == "" ]; then
	JAVA_HOME="/opt/jdk"
else
	JAVA_HOME="$1"

fi

if [ ! -f "/opt/jdk-8u151-linux-x64.tar.gz" ]; then
	echo 'jdk 安装包不存在，准备下载'
	wget --no-check-certificate --no-cookies --header "Cookie: oraclelicense=accept-securebackup-cookie" http://download.oracle.com/otn-pub/java/jdk/8u151-b12/e758a0de34e24606bca991d704f6dcbf/jdk-8u151-linux-x64.tar.gz

	tar -zxvf  jdk-8u151-linux-x64.tar.gz
else
	echo 'jdk 安装包已存在，准备执行解压操作.....'
fi


rm -rf jdk
ln -s jdk1.8.0_151 jdk

echo -e "\n
#jdk config
export JAVA_HOME="$JAVA_HOME"
export JRE_HOME="$JAVA_HOME/jre"
export CLASSPATH=.:${JAVA_HOME}/lib:${JRE_HOME}/lib
export PATH=${JAVA_HOME}/bin:$PATH" >> /etc/profile
`
source /etc/profile

echo "JDK 安装成功，安装目录：$JAVA_HOME，JDK版本：`java -version`"
