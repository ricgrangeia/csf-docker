FROM ubuntu:latest

LABEL authors="Ricardo"

RUN cd

RUN apt-get update && apt-get upgrade -y

RUN apt-get install -y wget iptables perl

RUN wget https://download.configserver.com/csf.tgz

RUN tar -xzf csf.tgz && cd csf && sh install.sh

RUN apt-get install -y nano

ENTRYPOINT ["tail", "-f", "/proc/1/fd/1"]

EXPOSE 6666