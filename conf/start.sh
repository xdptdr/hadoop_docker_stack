#!/bin/bash
service ssh start
export PS1="ps1"
. /etc/bash.bashrc
"$HADOOP_HOME"/sbin/start-all.sh
sudo su docker
