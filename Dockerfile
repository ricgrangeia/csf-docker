FROM alpine:latest

LABEL authors="Ricardo"

RUN echo "http://dl-cdn.alpinelinux.org/alpine/edge/main" > /etc/apk/repositories
RUN echo "http://dl-cdn.alpinelinux.org/alpine/edge/community" >> /etc/apk/repositories

RUN apk update && apk upgrade

RUN apk add wget iptables perl perl-libwww perl-time-hires

RUN cd /opt & wget https://download.configserver.com/csf.tgz --no-check-certificate

RUN tar -xzf csf.tgz && cd csf && sh install.sh

RUN cd /usr/local/csf/bin/ && perl csftest.pl

RUN apk add perl-io-socket-ssl

RUN apk add perl-net-ssleay

RUN apk add perl-crypt-ssleay

RUN apk add perl-net-libidn

RUN apk add perl-io-socket-inet6

RUN apk add perl-socket6

run apk add nano

#ENTRYPOINT ["top", "-b"]