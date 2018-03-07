#!/bin/bash
service ssh start
. /etc/commonrc
hdfs namenode -format
"$HADOOP_HOME"/sbin/start-all.sh
mapred --daemon start historyserver
mkdir "$DERBY_HOME"/data
sudo su docker
