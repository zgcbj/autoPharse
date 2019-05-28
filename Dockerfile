FROM remenberl/autophrase:latest
MAINTAINER zgc <zhanggc@yeah.net>

RUN apt-get update 
RUN apt-get install -y --force-yes make curl perl
ADD autophrase.tar.gz /

RUN \
    echo "===> compile" &&\
    cd /autophrase && bash compile.sh 


ENV COMPILE 0

WORKDIR /autophrase
