#!/usr/bin/env bash


if [ -z "$CREATE_TOPICS" ]; then
    exit 0
fi

# e.g. "topic1,topic2,topic3,..."
IFS=","; for topic in $CREATE_TOPICS; do
    kafka-topics.sh --create \
        --zookeeper localhost:2181 \
        --replication-factor 1 \
        --partitions 1 \
        --topic $topic \
        --if-not-exists

    echo "create topics: $topic"
done
