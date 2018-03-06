#!/bin/bash

if [ ! -e app ] ; then
	mkdir app
else
	echo "app found"
fi

if [ ! -e archives ] ; then
	mkdir archives
else
	echo "archives found"
fi

if [ ! -e app/jdk1.8.0_162 ] ; then
	if [ ! -e archives/jdk-8u162-linux-x64.tar.gz ] ; then
		wget --no-cookies --no-check-certificate \
		--header "Cookie: gpw_e24=http%3A%2F%2Fwww.oracle.com%2F; oraclelicense=accept-securebackup-cookie" \
		"http://download.oracle.com/otn-pub/java/jdk/8u162-b12/0da788060d494f5095bf8624735fa2f1/jdk-8u162-linux-x64.tar.gz" \
		-O archives/jdk-8u162-linux-x64.tar.gz
	else
		echo "archives/jdk-8u162-linux-x64.tar.gz found"
	fi
	tar xf archives/jdk-8u162-linux-x64.tar.gz -C ./app
else
	echo "app/jdk1.8.0_162 found"
fi

if [ ! -e app/hadoop-3.0.0 ] ; then
	if [ ! -e archives/hadoop-3.0.0.tar.gz ] ; then
		wget http://apache.crihan.fr/dist/hadoop/common/hadoop-3.0.0/hadoop-3.0.0.tar.gz \
		-O archives/hadoop-3.0.0.tar.gz
	else
		echo "archives/hadoop-3.0.0.tar.gz found"
	fi
	tar xf archives/hadoop-3.0.0.tar.gz -C ./app
else
	echo "app/hadoop-3.0.0 found"
fi
