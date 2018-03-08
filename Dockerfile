FROM ubuntu

# Updating, upgrading and installing some packages
RUN apt-get update && \
apt-get upgrade -y && \
apt-get install -y wget curl ca-certificates openssh-server maven openssh-client sudo vim scala

# UNPACK
WORKDIR /app
ADD ./archives/jdk-8u162-linux-x64.tar.gz /app
ADD ./archives/hadoop-3.0.0.tar.gz /app
ADD ./archives/pig-0.17.0.tar.gz /app
ADD ./archives/apache-hive-2.3.2-bin.tar.gz /app
ADD ./archives/db-derby-10.14.1.0-bin.tar.gz /app
ADD ./archives/spark-2.3.0-bin-without-hadoop.tgz /app
ADD ./archives/hbase-1.4.2-bin.tar.gz /app
ADD /samples /samples

# Fixing su
#RUN chmod u+s /bin/su

# docker user and group
RUN useradd -m -G sudo -d /home/docker -s /bin/bash docker
RUN chown docker:docker -R /samples
RUN chown docker:docker /app

# SUDO
COPY ./conf/sudoers /tmp
RUN cat /tmp/sudoers >/etc/sudoers
RUN rm /tmp/sudoers
RUN touch /home/docker/.sudo_as_admin_successful

# SSH
RUN update-rc.d ssh defaults
RUN ssh-keygen -t rsa -P '' -f ~/.ssh/id_rsa
RUN cat ~/.ssh/id_rsa.pub >> ~/.ssh/authorized_keys
RUN chmod 0600 ~/.ssh/authorized_keys
RUN cp -Rv ~/.ssh /home/docker
RUN chown -R docker:docker /home/docker/.ssh

# HADOOP CONFIG
COPY ./conf/hadoop/* /app/hadoop-3.0.0/etc/hadoop/

# BASHRC
COPY ./conf/bash/commonrc /etc
RUN echo '. /etc/commonrc' >>/etc/bash.bashrc

# HADOOP
RUN sed 's+^# export JAVA_HOME=$+export JAVA_HOME=/app/jdk1.8.0_162/+' -i /app/hadoop-3.0.0/etc/hadoop/hadoop-env.sh

# HIVE
COPY ./conf/hive/hive-env.sh /app/apache-hive-2.3.2-bin/conf
COPY ./conf/hive/hive-site.xml /app/apache-hive-2.3.2-bin/conf
COPY ./conf/hive/jpox.properties /app/apache-hive-2.3.2-bin/conf

# INITIALIZATION
COPY ./conf/start.sh /
RUN chmod +x /start.sh
WORKDIR /samples
CMD /start.sh

