#!/bin/bash


cd /opt


curl -O http://download.redis.io/releases/redis-4.0.6.tar.gz
tar -zxvf redis-4.0.6.tar.gz

# 检查是否已经安装了GCC环境

#rpm -qa |grep gcc


#安装依赖
cd redis-4.0.6/deps
make hiredis lua jemalloc linenoise

cd ..
#编译和安装
make & make install

echo 'redis install successed'
