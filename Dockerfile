FROM ubuntu

# Updating, upgrading and installing some packages
RUN apt-get update
RUN apt-get upgrade -y
RUN apt-get install -y wget curl ca-certificates openssh-server maven openssh-client sudo

# Fixing su
#RUN chmod u+s /bin/su

# docker user and group
RUN useradd -m -G sudo -d /home/docker docker

# SUDO
COPY ./conf/sudoers /tmp
RUN cat /tmp/sudoers >/etc/sudoers
RUN rm /tmp/sudoers

# SSH
RUN update-rc.d ssh defaults
RUN ssh-keygen -t rsa -P '' -f ~/.ssh/id_rsa
RUN cat ~/.ssh/id_rsa.pub >> ~/.ssh/authorized_keys
RUN chmod 0600 ~/.ssh/authorized_keys
RUN cp -Rv ~/.ssh /home/docker
RUN chown -R docker:docker /home/docker/.ssh

# UNPACK
WORKDIR /app
ADD ./archives/jdk-8u162-linux-x64.tar.gz /app
ADD ./archives/hadoop-3.0.0.tar.gz /app

# HADOOP CONFIG
COPY ./conf/hadoop/* /app/hadoop-3.0.0/etc/hadoop/

# BASHRC
RUN touch ~/.bashrc
RUN touch /home/docker/.bashrc
RUN chown docker:docker /home/docker/.bashrc

# HADOOP
RUN cat /app/hadoop-3.0.0/etc/hadoop/bashrc >>~/.bashrc
RUN cat /app/hadoop-3.0.0/etc/hadoop/bashrc >>/home/docker/.bashrc
RUN rm /app/hadoop-3.0.0/etc/hadoop/bashrc 
RUN sed 's+^# export JAVA_HOME=$+export JAVA_HOME=/app/jdk1.8.0_162/+' -i /app/hadoop-3.0.0/etc/hadoop/hadoop-env.sh

# INITIALIZATION
COPY ./conf/start.sh /
RUN chmod +x /start.sh
CMD /start.sh

