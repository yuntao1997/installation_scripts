#!/bin/bash

curl -OL https://cache.ruby-lang.org/pub/ruby/2.4/ruby-2.4.3.tar.gz

tar -zxvf ruby-2.4.3.tar.gz

cd ruby-2.4.3

#编译ruby需要至少1G内存，如果小于1G内存，可通过添加交换分区的方式

#sudo mkdir -p /var/cache/swap/
#sudo dd if=/dev/zero of=/var/cache/swap/swap0 bs=1M count=512
#sudo chmod 0600 /var/cache/swap/swap0
#sudo mkswap /var/cache/swap/swap0 
#sudo swapon /var/cache/swap/swap0

./configure --prefix=/usr/local/ruby-2.4.3
make && make install

#添加环境变量
echo -e "\n
export PATH=$PATH:/usr/local/ruby-2.4.3/bin
" >> /etc/profile

source /etc/profile
