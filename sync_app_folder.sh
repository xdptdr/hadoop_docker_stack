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

if [ ! -e archives/apache-hive-2.3.2-bin.tar.gz ] ; then
	wget http://apache.crihan.fr/dist/hive/hive-2.3.2/apache-hive-2.3.2-bin.tar.gz \
	-O archives/apache-hive-2.3.2-bin.tar.gz
else
	echo "archives/apache-hive-2.3.2-bin.tar.gz found"
fi

if [ ! -e archives/db-derby-10.14.1.0-bin.tar.gz ] ; then
	wget http://wwwftp.ciril.fr/pub/apache//db/derby/db-derby-10.14.1.0/db-derby-10.14.1.0-bin.tar.gz \
	-O archives/db-derby-10.14.1.0-bin.tar.gz
else
	echo "archives/db-derby-10.14.1.0-bin.tar.gz found"
fi

if [ ! -e archives/spark-2.3.0-bin-without-hadoop.tgz ] ; then
	wget http://apache.crihan.fr/dist/spark/spark-2.3.0/spark-2.3.0-bin-without-hadoop.tgz \
	-O archives/spark-2.3.0-bin-without-hadoop.tgz
else
	echo "archives/spark-2.3.0-bin-without-hadoop.tgz found"
fi

if [ ! -e archives/hbase-1.4.2-bin.tar.gz ] ; then
	wget http://apache.crihan.fr/dist/hbase/1.4.2/hbase-1.4.2-bin.tar.gz \
	-O archives/hbase-1.4.2-bin.tar.gz
else
	echo "archives/hbase-1.4.2-bin.tar.gz found"
fi
