FROM circleci/golang:1.10.1

USER root

RUN wget http://security.debian.org/debian-security/pool/updates/main/o/openssl/libssl1.0.0_1.0.1t-1+deb8u8_amd64.deb && \
        dpkg -i libssl1.0.0_1.0.1t-1+deb8u8_amd64.deb
        
RUN apt-get install software-properties-common apt-transport-https && \
        wget -qO - https://packages.confluent.io/deb/4.1/archive.key | sudo apt-key add - && \
        add-apt-repository "deb [arch=amd64] https://packages.confluent.io/deb/4.1 stable main" && \
        apt-get update && apt-get install librdkafka1 librdkafka++1 librdkafka1-dbg librdkafka-dev