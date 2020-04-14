#!/bin/bash

######################      Note      #######################
#
#  - The server should connect to Internet
#  - Make sure your docker environment is setup and running 
#
#############################################################

#### Login to docker
docker login

#### Oracle Database
DB_NAME=ODB1
DB_PORT=1521
DB_HOME=/home/oracle/oradata
docker run -d -it --name $DB_NAME -p $DB_PORT:$DB_PORT -v $DB_HOME:$DB_HOME store/oracle/database-enterprise:12.2.0.1
docker exec -it dockerDB /bin/bash

#### IBM DB2
mkdir /tmp/Docker
cd /tmp/Docker
docker login
docker pull ibmcom/db2
type nul > ".env_list"

echo -e 'LICENSE=accept
DB2INSTANCE=db2inst1
DB2INST1_PASSWORD=password
DBNAME=testdb
BLU=false
ENABLE_ORACLE_COMPATIBILITY=false
UPDATEAVAIL=NO
TO_CREATE_SAMPLEDB=false
REPODB=false
IS_OSXFS=false
PERSISTENT_HOME=false
HADR_ENABLED=false
ETCD_ENDPOINT=
ETCD_USERNAME=
ETCD_PASSWORD=' >> .env_list

docker run -h db2server --name db2server --restart=always --detach --privileged=true -p 50000:50000 --env-file .env_list -v /Docker:/database ibmcom/db2
docker exec -ti db2server bash -c "su – db2inst1"

#### Postgres
DB_NAME=postgres-test
DB_PASSWORD=mysecretpassword
DB_PORT=5432
docker run --name $DB_NAME -e POSTGRES_PASSWORD=$DB_PASSWORD -d -p $DB_PORT:$DB_PORT -v $HOME/docker/volumes/postgres:/var/lib/postgresql/data  postgres

#### Mysql
DB_NAME=mysql01
docker pull mysql/mysql-server:latest
docker run --name=$DB_NAME -d mysql/mysql-server:latest
docker logs $DB_NAME                      ## Get password
docker exec -it $DB_NAME mysql -uroot -p  ## Login to your mysql database

#### MongoDB
DB_NAME=mongodb
docker pull mongo       
docker run -d -p 27017-27019:27017-27019 --name $DB_NAME mongo:latest
docker exec -it mongodb bash
