FROM remenberl/autophrase:latest
MAINTAINER zgc <zhanggc@yeah.net>

RUN printf "deb http://archive.debian.org/debian/ jessie main\ndeb-src http://archive.debian.org/debian/ jessie main\ndeb http://security.debian.org jessie/updates main\ndeb-src http://security.debian.org jessie/updates main" > /etc/apt/sources.list

RUN apt-get update && apt-get install -y --force-yes make curl perl

ADD autophrase.tar.gz /

RUN \
    echo "===> compile" &&\
    cd /autophrase && bash compile.sh 


ENV COMPILE 0

WORKDIR /autophrase
