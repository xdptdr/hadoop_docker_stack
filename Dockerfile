#FROM alpine:latest
FROM frolvlad/alpine-glibc
RUN apk update
RUN apk upgrade
RUN apk add bash bash-completion wget curl ca-certificates libstdc++ java-cacerts openssh-server
RUN ssh-keygen -t rsa -P '' -f ~/.ssh/id_rsa
RUN cat ~/.ssh/id_rsa.pub >> ~/.ssh/authorized_keys
RUN chmod 0600 ~/.ssh/authorized_keys
WORKDIR /app
ADD ./app /app
ENV JAVA_HOME /app/jdk1.8.0_162
ENV PATH ${PATH}:${JAVA_HOME}/bin
CMD bash

#RUN pip install --trusted-host pypi.python.org -r requirements.txt
#EXPOSE 80

#CMD ["python", "app.py"]

