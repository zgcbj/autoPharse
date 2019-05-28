FROM remenberl/autophrase:latest
MAINTAINER zgc <zhanggc@yeah.net>

RUN printf "deb http://archive.debian.org/debian/ jessie main\ndeb-src http://archive.debian.org/debian/ jessie main\ndeb http://security.debian.org jessie/updates main\ndeb-src http://security.debian.org jessie/updates main" > /etc/apt/sources.list

RUN apt-get update && apt-get install -y --force-yes make curl perl

ADD autophrase.tar.gz /

RUN \
    echo "===> compile" &&\
    cd /autophrase && bash compile.sh 

RUN cd /autophrase && wget  http://www.cis.uni-muenchen.de/~schmid/tools/TreeTagger/data/english.par.gz && \
       gunzip english.par.gz && mv english-utf8.par tools/treetagger/lib/english-utf8.par
ENV COMPILE 0

WORKDIR /autophrase
