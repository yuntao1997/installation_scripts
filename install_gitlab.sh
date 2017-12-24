#!/bin/sh

# install gitlab from rpm package

FILE_NAME="gitlab-ce-10.2.4-ce.0.el6.x86_64.rpm"

cd /opt/
if [ ! -f "/opt/$FILE_NAME" ]; then
	echo '当前目录不存在gitlab安装包,$FILE_NAME'
	#download rpm package from the mirror
	exit 0
	wget https://mirrors.tuna.tsinghua.edu.cn/gitlab-ce/yum/el6/gitlab-ce-10.2.4-ce.0.el6.x86_64.rpm

fi



#install dependencies
sudo yum install -y curl openssh-server openssh-clients cronie
sudo lokkit -s http -s ssh



#install mail server
sudo yum install postfix 
sudo service postfix start 
sudo chkconfigpostfix on 

#install gitlab
echo "gitlab install begining.."
sudo rpm -ivh "$FILE_NAME"
echo "gitlab install end"

echo -e "\n
external_url = 'http://gitlab.yunta.com'\n
unicorn['port'] = 8088
" >> /etc/gitlab/gitlab.rb

# start gitlab
sudo gitlab-ctl reconfigure
