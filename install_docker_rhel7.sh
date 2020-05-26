#/bin/bash

################      Note      ####################
#
#  - The server should connect to Internet
#  - Setup yum repository and mount your CD, or online using this mirror http://mirror.centos.org/centos/7/os/x86_64/
#  - The following script was tested on RHEL 7.4
#
####################################################

yum install -y yum-utils device-mapper-persistent-data lvm2
yum-config-manager --add-repo https://download.docker.com/linux/centos/docker-ce.repo
yum install -y http://mirror.centos.org/centos/7/extras/x86_64/Packages/container-selinux-2.107-3.el7.noarch.rpm
yum install -y https://download.docker.com/linux/centos/7/x86_64/stable/Packages/containerd.io-1.2.6-3.3.el7.x86_64.rpm
yum install -y git curl
yum install -y docker-ce
systemctl enable docker.service
systemctl start docker.service
systemctl status docker.service

## docker run hello-world
