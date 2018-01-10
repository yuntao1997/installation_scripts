#!/bin/bash


yum install -y gcc-c++

yum install -y pcre pcre-devel

yum install -y zlib zlib-devel

yum install -y openssl openssl-devel



curl -O http://nginx.org/download/nginx-1.12.2.tar.gz
tar -zxvf nginx-1.12.2.tar.gz

cd nginx-1.12.2

./configure
make && make install

echo "安装路径:`whereis nginx`"

echo -e "\n
#nginx config
export PATH=$PATH:`whereis nginx | cut -d : -f 2 | sed 's/ //g'/sbin`
" >> /etc/profile

