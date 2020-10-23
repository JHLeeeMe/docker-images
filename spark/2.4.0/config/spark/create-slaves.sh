#!/usr/bin/env bash


if [ -z $SLAVE_NUM ]; then
    exit 0
fi

# Create workers
for i in `seq 1 ${SLAVE_NUM}`; do
    echo -e "slave-$i\n" > $HADOOP_CONF_DIR/workers
done
