#!/usr/bin/env bash


# Create network
line=$(docker network ls |grep zeppelin_net |wc -l)
if [ $line -eq 0 ]; then
    docker network create \
        --subnet 10.0.0.0/24 \
        zeppelin_net
fi

docker run \
    -itd \
    --name zeppelin \
    --hostname zeppelin \
    --network zeppelin_net \
    --ip 10.0.0.20 \
    -p 7777:7777 \
    jhleeeme/zeppelin:0.8.2 \
    /bin/bash
