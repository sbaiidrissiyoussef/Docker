#/bin/bash

################      Note      ####################
#
#  - The server should connect to Internet
#  - Setup yum repository and mount your CD
#  - The following script was tested on RHEL 8.1
#
####################################################

## Remove podman from RHEL 8 
yum remove podman -y

## Install Docker
dnf config-manager --add-repo=https://download.docker.com/linux/centos/docker-ce.repo
dnf list docker-ce
yum install -y https://download.docker.com/linux/centos/7/x86_64/stable/Packages/containerd.io-1.2.6-3.3.el7.x86_64.rpm
dnf install docker-ce -y
yum install git 

## Enable docker services
systemctl start docker
systemctl enable docker

## Verify installation by runnig Hello-World
docker run hello-world

## Intall docker-compose
dnf install curl -y
curl -L "https://github.com/docker/compose/releases/download/1.25.0/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose
chmod +x /usr/local/bin/docker-compose
docker-compose --version

