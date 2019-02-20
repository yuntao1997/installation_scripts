#卸载自带的git

yum remove git


#下载最新版git
wget https://www.kernel.org/pub/software/scm/git/git-2.9.5.tar.gz

#解压
tar -zxvf git-2.9.5.tar.gz
cd git-2.9.5


yum -y install unzip

#使用make prefix=/opt/git all doc info ;安装doc时需要安装asciidoc依赖
#curl -OL https://nchc.dl.sourceforge.net/project/asciidoc/asciidoc/8.6.9/asciidoc-8.6.9.zip
#unzip asciidoc-8.6.9.zip
#cd asciidoc-8.6.9
#./configure --prefix=/usr/local/asciidoc-8.6.9
#make && make install
#echo -e "\n export PATH=$PATH:/usr/local/asciidoc-8.6.9/bin/" >> /etc/profile

#安装依赖
yum -y install gcc
yum -y install openssl-devel curl-devel expat-devel gettext-devel zlib-devel
yum -y install perl-devel
yum -y install libxslt xmlto
#编译安装
# 这里同时指定all和doc这两个目标，指定doc是为了安装git的帮助文档到man手册里面，只指定all的话，默认并不包含git的帮助文档，这样在man手册中就查不到git的帮助。
#make prefix=/opt/git all doc info ;
make prefix=/usr/local/git-2.9.5 all doc info
./configure --prefix=/usr/local/git --with-iconv=/usr/local/libiconv
