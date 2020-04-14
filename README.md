# Docker
Script automating the deployment different solutions ( Databases, Application Servers, Web Servers ... ) on Docker.


#### Docker Introduction
Docker is a set of platform as a service (PaaS) products that uses OS-level virtualization to deliver software in packages called containers. Containers are isolated from one another and bundle their own software, libraries and configuration files; they can communicate with each other through well-defined channels. All containers are run by a single operating system kernel and therefore use fewer resources than virtual machines. 

#### Docker Installation
Make sure you setup your yum before launching the script

```
mount -o loop /dev/sr0 /mnt
cp /mnt/media.repo /etc/yum.repos.d/
echo "[InstallMedia]" > /etc/yum.repos.d/media.repo
echo "name=Red Hat Enterprise Linux 8.1.0" >> /etc/yum.repos.d/media.repo
echo "gpgcheck=0" >> /etc/yum.repos.d/media.repo
echo "baseurl=file:///mnt/AppStream" >> /etc/yum.repos.d/media.repo

```
Launch the installation of Docker Container as follow : 
```
./install_docker.sh
```
#### Docker Verification
Verify your docker installation by checking the version and running the HelloWorld image
```
docker --version
docker run hello-world
```

