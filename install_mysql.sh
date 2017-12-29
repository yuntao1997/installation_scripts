#!/bin/bash


#判断是否安装了MySQL
result=`rpm -qa | grep -i mysql`
if [ "$result" != "" ]; then
	echo "Mysql 已安装，即将移除..."
	yum -y remove mysql-community*
	echo "Mysql 移除成功"
fi

#download rpm package

#下载MySQL源安装包
curl -OL https://dev.mysql.com/get/mysql57-community-release-el7-11.noarch.rpm
yum -y localinstall mysql57-community-release-el7-11.noarch.rpm

result=`yum repolist enabled | grep "mysql.*-community.*"`
if [ "$result" = "" ]; then
	echo "MySQL源安装失败,本次安装取消"
	exit 0
else
	echo "MySQL源已启用"
fi

#echo "即将下载安装包..."
#curl -OL https://dev.mysql.com/get/Downloads/MySQL-5.7/mysql-community-server-5.7.20-1.el7.x86_64.rpm
#echo "安装包下载完毕"

#yum -y localinstall mysql-community-server-5.7.20-1.el7.x86_64.rpm

yum -y install mysql-community-server

#开机启动
systemctl enable mysqld
systemctl daemon-reload


#启动MySQL服务
service mysqld start
echo "密码：`cat /var/log/mysqld.log | grep -oE 'localhost: (.*?)' | awk -F ':' '{print($2)}'`,MySQL服务状态：`mysqld status`"

#mysql 添加新用户，设置密码策略，root默认不支持远程连接
#mysql -u root -password
#set global validate_password_policy=0;
#set global validate_password_length=1;
#create user 'admin'@'%' identified by '123456a';
