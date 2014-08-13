#!/bing/bash

yum -y install wget 

#备份源码
mv /etc/yum.repos.d/CentOS-Base.repo /etc/yum.repos.d/CentOS-Base.repo.backup

cd /etc/yum.repos.d/
wget http://mirrors.163.com/.help/CentOS6-Base-163.repo

#更新源码
yum clean all
yum makecache
