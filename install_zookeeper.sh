#!/bin/bash


curl -O http://mirrors.hust.edu.cn/apache/zookeeper/zookeeper-3.4.11/zookeeper-3.4.11.tar.gz

tar -zxvf zookeeper-3.4.11.tar.gz

cd ./zookeeper-3.4.11/conf

echo -e "\n
tickTime=2000
dataDir=/var/lib/zookeeper
clientPort=2181
" > zoo.cfg

echo -e "\n
export ZOOKEEPER_HOME=`pwd`/zookeeper-3.4.9
export PATH=$ZOOKEEPER_HOME/bin:$PATH" >> /etc/profile

source /etc/profile

#启动zookeeper
#bin/zkServer.sh start zoo.cfg

#连接zookeeper
#bin/zkCli.sh -server 127.0.0.1:2181

#查看zookeeper状态
#bin/zkServer.sh status zoo.cfg 

