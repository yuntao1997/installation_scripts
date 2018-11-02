#!/bin/sh

VERSION = "3.6.0"
FILE_NAME="apache-maven-${VERSION}-bin.tar.gz"
MAVEN_HOME="/opt/maven"

cd /opt/
if [ ! -f "/opt/$FILE_NAME" ]; then
	echo '当前目录不存在maven安装包,$FILE_NAME'
	#download rpm package from the mirror
	#exit 0
	wget "https://mirrors.tuna.tsinghua.edu.cn/apache/maven/maven-3/${VERSION}/binaries/apache-maven-${VERSION}-bin.tar.gz"

fi

#uncompression this file
tar -zxvf "apache-maven-${VERSION}-bin.tar.gz"


rm -rf maven
ln -s "apache-maven-${VERSION}" maven


echo -e "\n
#maven config
export MAVEN_HOME="${MAVEN_HOME}"
export PATH=$PATH:${MAVEN_HOME}/bin" >> /etc/profile


source /etc/profile

echo "MAVEN 安装成功，安装目录：${MAVEN_HOME}，Maven版本：`mvn -version`"
