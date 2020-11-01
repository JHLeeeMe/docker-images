#!/usr/bin/env bash


if [ -z $SLAVE_NUM ]; then
    echo "# `hostname -f`: SLAVE_NUM is not found."
    exit 0
fi

# Create workers
if [[ `cat $HADOOP_CONF_DIR/workers` == "localhost" ]]; then
    # remove line 1 (localhost) in workers
    sed -i 1d $HADOOP_CONF_DIR/workers

    for i in `seq 1 $SLAVE_NUM`; do
        echo "slave-$i" >> $HADOOP_CONF_DIR/workers
    done
fi

cp $HADOOP_CONF_DIR/workers $SPARK_HOME/conf/slaves
