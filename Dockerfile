FROM ubuntu:18.04

RUN apt-get update && \
    apt-get install -y wget && \
    wget https://github.com/EOSIO/eos/releases/download/v1.7.0/eosio_1.7.0-1-ubuntu-18.04_amd64.deb && \
    apt-get install -y ./eosio_1.7.0-1-ubuntu-18.04_amd64.deb && \
    rm ./eosio_1.7.0-1-ubuntu-18.04_amd64.deb && \
    apt-get remove -y --purge wget && \
    rm -fr  /var/lib/apt/lists/* && \
    mkdir /eosio-wallet /.local && \
    chgrp 0 /eosio-wallet /.local && \
    chmod g+rwX /eosio-wallet /.local

CMD [ "tail", "-f", "/dev/null" ]
