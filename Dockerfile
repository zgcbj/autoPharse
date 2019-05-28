FROM remenberl/autophrase:latest
MAINTAINER zgc <zhanggc@yeah.net>

RUN apt-get update && apt-get install -y --force-yes make curl perl
ADD autophrase.tar.gz /

RUN \
    echo "===> compile" &&\
    cd /autophrase && bash compile.sh 

RUN \
    echo "===> clean up..."  && \
    apt-get purge -y --force-yes make && \
    apt-get autoremove -y --purge make && \
    rm -rf /var/cache/oracle-jdk8-installer  && \
    apt-get clean  && \
    rm -rf /var/lib/apt/lists/*

ENV COMPILE 0

WORKDIR /autophrase
