#!/usr/bin/env bash


if [ $# -ne 1 ] || [ $1 -lt 2 ]; then
cat <<EOF
Slave Number
Usage: run-container.sh <2 ~ 254>
  if run.sh 3 >>> master, slave-1, slave-2, slave-3
  master (10.0.0.10)
  slave-1 (10.0.0.11), slave-2 (10.0.0.12), ..., slave-N (10.0.0.10+N)
EOF
    exit -1
fi

# Create network
line=$(docker network ls |grep hadoop-cluster |wc -l)
if [ $line -eq 0  ]; then
    docker network create \
        --subnet 10.0.0.0/24 \
        hadoop-cluster
fi

# Run master
docker run \
    -itd \
    --name master \
    --network hadoop-cluster \
    --ip 10.0.0.10 \
    -p 50070:50070 \
    jhleeeme/hadoop:3.2.1 \
    /bin/bash

# Run slave-N
tmp=11
for i in `seq 1 $1`
do
    docker run \
        -itd \
        --name slave-$i \
        --network hadoop-cluster \
        --ip 10.0.0.$tmp \
        jhleeeme/hadoop:3.2.1 \
        /bin/bash

    (( tmp += 1 ))
done
