# Version: 0.0.1
FROM debian:experimental

MAINTAINER Sander "superkoning@caiway.net"

RUN apt-get update -y && apt-get upgrade -y
RUN apt-get -t experimental install openssl  nzbget  ca-certificates -y 
RUN openssl genrsa -out nzbget-example.com.key 2048
RUN test -f /root/.rnd || touch /root/.rnd # See bug https://bugs.debian.org/cgi-bin/bugreport.cgi?bug=898470
RUN cd / && openssl req -new -x509 -key nzbget-example.com.key -out nzbget-example.com.cert -days 3650 -subj /CN=nzbget-example.com
RUN mkdir /my_content


RUN echo 'Hi, I am in your container'

EXPOSE 7891
