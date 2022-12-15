#!/usr/bin/env bash


echo "Starting zookeeper"
zookeeper-server-start.sh -daemon /opt/kafka/config/zookeeper.properties

echo "Starting kafka"
kafka-server-start.sh /opt/kafka/config/server.properties
#kafka-server-start.sh -daemon /opt/kafka/config/server.properties

#echo "Creating topics"
#/etc/create-topics.sh
#unset CREATE_TOPICS

# exec /bin/bash
#/bin/bash
