FROM ubuntu:20.04

ARG EOSIO_RELEASE
ENV EOSIO_RELEASE ${EOSIO_RELEASE:-1.7.0}
RUN apt-get update && \
    apt-get install -y wget && \
    wget https://github.com/EOSIO/eos/releases/download/v$EOSIO_RELEASE/eosio_$EOSIO_RELEASE-1-ubuntu-18.04_amd64.deb && \
    apt-get install -y ./eosio_$EOSIO_RELEASE-1-ubuntu-18.04_amd64.deb && \
    rm ./eosio_${EOSIO_RELEASE}-1-ubuntu-18.04_amd64.deb && \
    apt-get autoremove -y --purge wget && \
    rm -fr  /var/lib/apt/lists/* && \
    mkdir /eosio-wallet /.local && \
    chgrp 0 /eosio-wallet /.local && \
    chmod g+rwX /eosio-wallet /.local

CMD [ "tail", "-f", "/dev/null" ]
