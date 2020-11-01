#!/usr/bin/env bash

echo "Create topics"
/etc/create-topics.sh
unset CREATE_TOPICS

echo "Start zookeeper"
zookeeper-server-start.sh -daemon /opt/kafka/config/zookeeper.properties

echo "Start kafka"
kafka-server-start.sh /opt/kafka/config/server.properties

#/bin/bash -c "$*"
