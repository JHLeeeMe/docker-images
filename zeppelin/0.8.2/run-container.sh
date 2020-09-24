#!/usr/bin/env bash


docker run \
    -itd \
    --network spark-cluster \
    --name zeppelin \
    --ip 10.0.0.20 \
    -p 7777:7777 \
    jhleeeme/zeppelin:0.8.2 \
    /bin/bash
