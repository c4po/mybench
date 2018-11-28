FROM buildpack-deps

RUN curl -s https://packagecloud.io/install/repositories/akopytov/sysbench/script.deb.sh | bash
RUN apt-get -y install sysbench
WORKDIR /test
COPY lua /test

