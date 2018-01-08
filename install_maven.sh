#!/bin/sh

FILE_NAME="apache-maven-3.5.2-bin.tar.gz"
MAVEN_HOME="/opt/maven"

cd /opt/
if [ ! -f "/opt/$FILE_NAME" ]; then
	echo '当前目录不存在maven安装包,$FILE_NAME'
	#download rpm package from the mirror
	#exit 0
	wget http://mirrors.tuna.tsinghua.edu.cn/apache/maven/maven-3/3.5.2/binaries/apache-maven-3.5.2-bin.tar.gz

fi

#uncompression this file
tar -zxvf apache-maven-3.5.2-bin.tar.gz


rm -rf maven
ln -s apache-maven-3.5.2 maven


echo -e "\n
#maven config
export MAVEN_HOME="${MAVEN_HOME}"
export PATH=$PATH:${MAVEN_HOME}/bin" >> /etc/profile


source /etc/profile

echo "MAVEN 安装成功，安装目录：${MAVEN_HOME}，Maven版本：`mvn -version`"

