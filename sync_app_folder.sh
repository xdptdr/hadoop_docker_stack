#!/bin/bash

if [ ! -e archives ] ; then
	mkdir archives
else
	echo "archives found"
fi

if [ ! -e archives/jdk-8u162-linux-x64.tar.gz ] ; then
	wget --no-cookies --no-check-certificate \
	--header "Cookie: gpw_e24=http%3A%2F%2Fwww.oracle.com%2F; oraclelicense=accept-securebackup-cookie" \
	"http://download.oracle.com/otn-pub/java/jdk/8u162-b12/0da788060d494f5095bf8624735fa2f1/jdk-8u162-linux-x64.tar.gz" \
	-O archives/jdk-8u162-linux-x64.tar.gz
else
	echo "archives/jdk-8u162-linux-x64.tar.gz found"
fi

if [ ! -e archives/hadoop-3.0.0.tar.gz ] ; then
	wget http://apache.crihan.fr/dist/hadoop/common/hadoop-3.0.0/hadoop-3.0.0.tar.gz \
	-O archives/hadoop-3.0.0.tar.gz
else
	echo "archives/hadoop-3.0.0.tar.gz found"
fi

if [ ! -e archives/pig-0.17.0.tar.gz ] ; then
	wget http://apache.crihan.fr/dist/pig/pig-0.17.0/pig-0.17.0.tar.gz \
	-O archives/pig-0.17.0.tar.gz
else
	echo "archives/pig-0.17.0.tar.gz found"
fi
