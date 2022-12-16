#!/bin/bash

: ${HADOOP_PREFIX:=/opt/hadoop}

# installing libraries if any - (resource urls added comma separated to the ACP system variable)
cd $HADOOP_PREFIX/share/hadoop/common ; for cp in ${ACP//,/ }; do  echo == $cp; curl -LO $cp ; done; cd -

# Start ssh
echo "# $(hostname -f): ssh start"
service ssh start

# Modify workers
echo "# $(hostname -f): exec create-workers.sh"
/etc/create-workers.sh $WORKER_NUM
unset WORKER_NUM

# in master server
if [[ $(uname -n) == "master" ]]; then
    start-dfs.sh && start-yarn.sh
fi

echo "# $(hostname -f): exec /bin/bash"
#CMD=${1:-"exit 0"}
CMD="$1"
if [[ "$CMD" == "-d" ]];
then
    service sshd stop
    /usr/sbin/sshd -D -d
else
    #/bin/bash -c "$*"
    /bin/bash
fi
