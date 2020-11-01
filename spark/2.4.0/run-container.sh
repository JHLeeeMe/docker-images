#!/usr/bin/env bash


if [ $# -ne 1 ] || [ $1 -lt 2 ]; then
    echo 'Slave Number'
    echo 'Usage: run-container.sh <2 ~ 254>'
    echo '  if run.sh 3 >>> master, slave-1, slave-2, slave-3'
    echo '  master (10.0.0.10)'
    echo '  slave-1 (10.0.0.11), slave-2 (10.0.0.12), ..., slave-N (10.0.0.10+N)'
    exit -1
fi

# Create network
line=$(docker network ls |grep spark-cluster |wc -l)
if [ $line -eq 0 ]; then
    docker network create \
        --subnet 10.0.0.0/24 \
        spark-cluster
fi

# Run slave-N
tmp=11
for i in `seq 1 $1`; do
    docker run \
        -itd \
        --name slave-$i \
        --hostname slave-$i \
        --network spark-cluster \
        --ip 10.0.0.$tmp \
        jhleeeme/spark:2.4.0

    (( tmp += 1 ))
done

# Run master
docker run \
    -itd \
    --name master \
    --hostname master \
    --network spark-cluster \
    --ip 10.0.0.10 \
    -p 28088:8088 \
    -e SLAVE_NUM=3 \
    jhleeeme/spark:2.4.0

