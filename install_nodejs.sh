#!/bin/sh

VERSION="10.15.0"
FILE_NAME="node-v${VERSION}-linux-x64.tar.gz"
NODE_HOME="/opt/nodejs"

cd /opt/
if [ ! -f "/opt/$FILE_NAME" ]; then
	echo '当前目录不存在nodejs安装包,$FILE_NAME'
	#download rpm package from the mirror
	#exit 0
	#wget "https://mirrors.tuna.tsinghua.edu.cn/apache/maven/maven-3/${VERSION}/binaries/apache-maven-${VERSION}-bin.tar.gz"
	wget "https://nodejs.org/dist/v${VERSION}/node-v${VERSION}-linux-x64.tar.xz"

fi

#uncompression this file
tar -xvf "${FILE_NAME}"


ln -s /opt/${FILE_NAME}/bin/node /usr/local/bin/
ln -s /opt/${FILE_NAME}/bin/npm /usr/local/bin/


echo "NODE 安装成功，安装目录：${NODE_HOME}，Maven版本：`node -v`"
