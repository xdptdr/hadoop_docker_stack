#!/bin/bash
chown docker:docker -R /app/solr-7.2.1
mkdir -p /data/zookeeper
chown docker:docker -R /data
service ssh start
. /etc/commonrc
hdfs namenode -format
"$HADOOP_HOME"/sbin/start-all.sh
mapred --daemon start historyserver
mkdir "$DERBY_HOME"/data
sudo su docker
