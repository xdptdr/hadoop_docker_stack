.PHONY: ALL

ALL: app/jdk1.8.0_162 app/hadoop-3.0.0

hadoop-3.0.0.tar.gz:
	wget http://apache.crihan.fr/dist/hadoop/common/hadoop-3.0.0/hadoop-3.0.0.tar.gz -O archives/hadoop-3.0.0.tar.gz

jdk-8u162-linux-x64.tar.gz:
	wget --no-cookies --no-check-certificate --header "Cookie: gpw_e24=http%3A%2F%2Fwww.oracle.com%2F; oraclelicense=accept-securebackup-cookie" "http://download.oracle.com/otn-pub/java/jdk/8u162-b12/0da788060d494f5095bf8624735fa2f1/jdk-8u162-linux-x64.tar.gz" -O archives/jdk-8u162-linux-x64.tar.gz

app:
	mkdir app

app/jdk1.8.0_162 : app archives/jdk-8u162-linux-x64.tar.gz
	tar xf archives/jdk-8u162-linux-x64.tar.gz -C ./app

app/hadoop-3.0.0 : app archives/hadoop-3.0.0.tar.gz
	tar xf archives/hadoop-3.0.0.tar.gz -C ./app
