#! /bin/bash
PATH=/bin:/sbin:/usr/bin:/usr/sbin:/usr/local/bin:/usr/local/sbin:~/bin
export PATH
#===============================================================================================
#   System Required:  CentOS / RedHat / Fedora 
#   Description:  auto back mysqldatabase
#   Author: Lurenjia <cn.lurenjian@gmial.com>
#   Intro:  http://lurenjian.org.cn Version=1.0
#===============================================================================================
clear
echo "#############################################################"
echo "# 163 Source Auto Install Script for CentOS / RedHat / Fedora"
echo "# Intro: http://lurenjian.org.cn Version=1.0" 
echo "#"
echo "# Author: Lurenjia <cn.lurenjian@gmial.com>"
echo "#"
echo "#############################################################"
echo ""
#禁用SELINUX
if [ -s /etc/selinux/config ] && grep 'SELINUX=enforcing' /etc/selinux/config; then
    sed -i 's/SELINUX=enforcing/SELINUX=disabled/g' /etc/selinux/config
    setenforce 0
fi
#时间配置准确
rm -f /etc/localtime
ln -s /usr/share/zoneinfo/Asia/Shanghai /etc/localtime
yum -y install ntp
ntpdate us.pool.ntp.org
hwclock -w
#安装环境要求
yum -y install wget 
#备份源码
mv /etc/yum.repos.d/CentOS-Base.repo /etc/yum.repos.d/CentOS-Base.repo.backup
#下载新源
cd /etc/yum.repos.d/
wget http://mirrors.163.com/.help/CentOS6-Base-163.repo
#更新源码
yum clean all
yum makecache
echo "Successfully install 163 Source!!"
