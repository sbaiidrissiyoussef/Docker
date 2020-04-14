#!/bin/bash

######################      Note      #######################
#
#  - The server should connect to Internet
#  - Make sure your docker environment is setup and running 
#
#############################################################

### IBM MQ on Docker
docker login
docker run --env LICENSE=view ibmcom/mq:9
docker run --env LICENSE=accept --env MQ_QMGR_NAME=QM1 --volume /var/example:/mnt/mqm --publish 1414:1414 --publish 9443:9443 --detach ibmcom/mq:9
echo " MQ Console : https://$(hostname):9443/ibmmq/console/"

### IBM Websphere Traditional on Docker
docker login
docker pull ibmcom/websphere-traditional
docker run --name ws -h ws -p 9043:9043 -p 9443:9443 -d ibmcom/websphere-traditional
docker exec test cat /tmp/PASSWORD # Get Password 
echo " IBM Websphere Deployment Manager : https://$(hostname):9043/ibm/console"


### IBM HTTP Server
doker login
docker run --name ihs -h ihs -p 80:80 -d ibmcom/ibm-http-server
echo " IBM HTTP Server : http://$(hostname)"

#### Oracle Weblogic
docker login
mkdir /opt/weblogic
touch /opt/weblogic/domain.properties
echo 'username=myadminusername
      password=myadminpassword' >> /opt/weblogic/domain.properties
docker run -d -p 7001:7001 -p 9002:9002 -v /opt/weblogic:/u01/oracle/properties store/oracle/weblogic:12.2.1.4
echo " Oracle Weblogic Console : https://$(hostname):9002/console "

## Websphere Liberty on Docker
docker login
docker pull ibmcom/websphere-liberty
docker run -d -p 80:9080 -p 443:9443 websphere-liberty:webProfile8


