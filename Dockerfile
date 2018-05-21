FROM circleci/golang:1.10.1

USER root

RUN git clone https://github.com/edenhill/librdkafka.git && \
    cd librdkafka && git checkout v0.11.4 && ./configure && make && make install