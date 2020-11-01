#!/usr/bin/env bash


docker run \
    -it \
    --name kafka-single-node \
    --ip 10.0.0.30 \
    --network spark-cluster \
    -e CREATE_TOPICS=iot,words \
    jhleeeme/kafka-single-node:2.11-2.4.1
