#!/bin/bash
service ssh start
. /etc/commonrc
hdfs namenode -format
"$HADOOP_HOME"/sbin/start-all.sh
sudo su docker
