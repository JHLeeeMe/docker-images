#!/usr/bin/env bash


: ${HADOOP_PREFIX:=/opt/hadoop}

# installing libraries if any - (resource urls added comma separated to the ACP system variable)
cd $HADOOP_PREFIX/share/hadoop/common ; for cp in ${ACP//,/ }; do  echo == $cp; curl -LO $cp ; done; cd -

# Start ssh
echo "# $(hostname -f): ssh start"
service ssh start

# Modify workers & slaves
echo "# $(hostname -f): exec create-slaves.sh"
/etc/create-slaves.sh $SLAVE_NUM
unset SLAVE_NUM

cp $SPARK_HOME/conf/metrics.properties.template $SPARK_HOME/conf/metrics.properties
cp $SPARK_HOME/conf/log4j.properties.template $SPARK_HOME/conf/log4j.properties
sed -i "s/INFO/WARN/g" $SPARK_HOME/conf/log4j.properties

# in master server
if [[ $(uname -n) == "master" ]]; then
    # Start yarn, hdfs, master, slaves
    start-yarn.sh && start-dfs.sh && start-master.sh && start-slaves.sh

    # Create directory in hdfs 
    hdfs dfs -mkdir -p /spark/shared-logs/
fi

# Create a user in the start up if NEW_USER environment variable is given
# EX: docker run  -e NEW_USER=kmucs -e RSA_PUBLIC_KEY="...."  ...
if [[ ! -z $NEW_USER ]]; then
    adduser --disabled-password --gecos ""  "$NEW_USER" > /dev/null
    usermod -aG sudo "$NEW_USER" > /dev/null
    sudo -u "$NEW_USER" mkdir /home/"$NEW_USER"/.ssh
    sudo -u "$NEW_USER" chmod 700 /home/"$NEW_USER"/.ssh
    sudo -u "$NEW_USER" touch /home/"$NEW_USER"/.ssh/authorized_keys

    if [[ ! -z $RSA_PUBLIC_KEY ]];
    then
        sudo -u "$NEW_USER" echo "$RSA_PUBLIC_KEY" >> /home/"$NEW_USER"/.ssh/authorized_keys
    else
        sudo -u "$NEW_USER" cat /tmp/id_rsa.pub >> /home/"$NEW_USER"/.ssh/authorized_keys
    fi
    sudo -u "$NEW_USER" chmod 600 /home/"$NEW_USER"/.ssh/authorized_keys

    echo "export HADOOP_HOME=$HADOOP_HOME" >> /home/"$NEW_USER"/.bashrc
    echo "export SPARK_HOME=$SPARK_HOME" >> /home/"$NEW_USER"/.bashrc
    echo "export HADOOP_CONF_DIR=$HADOOP_CONF_DIR" >> /home/"$NEW_USER"/.bashrc

    echo "export PATH=\$PATH:$PATH" >> /home/"$NEW_USER"/.bashrc
    echo "export LD_LIBRARY_PATH=\$LD_LIBRARY_PATH:$LD_LIBRARY_PATH" >> /home/"$NEW_USER"/.bashrc
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
