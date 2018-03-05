#FROM alpine:latest
FROM frolvlad/alpine-glibc
RUN apk update
RUN apk upgrade
RUN apk add bash bash-completion wget curl ca-certificates libstdc++ java-cacerts openssh-server maven openssh-client openrc openssh
RUN chmod u+s /bin/su
RUN adduser -S docker
RUN addgroup docker
RUN addgroup docker docker
RUN ssh-keygen -t rsa -P '' -f ~/.ssh/id_rsa
RUN cat ~/.ssh/id_rsa.pub >> ~/.ssh/authorized_keys
RUN chmod 0600 ~/.ssh/authorized_keys
RUN cp -Rv ~/.ssh /home/docker
RUN chown -R docker:docker ~/.ssh
WORKDIR /app
ADD ./app /app
COPY ./conf/hadoop/* /app/hadoop-3.0.0/etc/hadoop/
RUN cat /app/hadoop-3.0.0/etc/hadoop/bashrc >>~/.bashrc
RUN cat /app/hadoop-3.0.0/etc/hadoop/bashrc >>/home/docker/.bashrc
RUN chown docker:docker /home/docker/.bashrc
RUN rm /app/hadoop-3.0.0/etc/hadoop/bashrc 
RUN sed 's+^# export JAVA_HOME=$+export JAVA_HOME=/app/jdk1.8.0_162/+' -i /app/hadoop-3.0.0/etc/hadoop/hadoop-env.sh
ENV JAVA_HOME /app/jdk1.8.0_162
ENV PATH ${JAVA_HOME}/bin:${PATH}
EXPOSE 22
CMD bash

