# Hadoop images
BASE: ```jhleeeme/ubuntu:18.04```  
Contains: ```Java-1.8```, ```Hadoop-3.2.1```

## Tags
- ```3.2.1```

## Usage
### 1. Pull or Build
Pull
1. Create docker network
```bash
$ docker network create --subnet 10.0.0.0/24 <network-name>

# network list
$ docker network ls
```

2. Pull & Run
```bash
$ docker pull jhleeeme/hadoop:3.2.1

# run master
$ docker run -itd --ip 10.0.0.<2~254> --network <network-name> --name master [-p <local-port>:50070] jhleeeme/hadoop:3.2.1 /bin/bash

# run slave
$ docker run -itd --ip 10.0.0.<2~254> --network <network-name> [--name <slave-name>] jhleeeme/hadoop:3.2.1 /bin/bash
$ docker run -itd --ip 10.0.0.<2~254> --network <network-name> [--name <slave-name>] jhleeeme/hadoop:3.2.1 /bin/bash
~~~~~
$ docker run -itd --ip 10.0.0.<2~254> --network <network-name> [--name <slave-name>] jhleeeme/hadoop:3.2.1 /bin/bash
```

OR  

Build
1. Download Dockfile & run-container.sh & config folder
```bash
# Execute run-container.sh
$ ./run-container.sh <slave-server number>

# e.g.
$ ./run-container.sh 3
  # create network & run master, slave
  > network-name = hadoop-cluster
  > master (10.0.0.10), slave-1 (10.0.0.11), slave-2 (10.0.0.12), slave-3 (10.0.0.13)
```

### 2. Modify config
```bash
# attach master
$ docker attach master

# modify workers
master$ cd /opt/hadoop/etc/hadoop
master$ sed 1d workers > tmp && mv tmp workers
master$ echo "<slave-name>" >> workers
master$ echo "<slave-name>" >> workers
~~~~~~~
master$ echo "<slave-name>" >> workers
```

### 3. Start hadoop
```bash
# start hdfs, yarn
master$ start-dfs.sh && start-yarn.sh

# check jps
master$ jps
master$ ssh <slave-name> '/opt/java/bin/jps'
```

### 4. Hello, Hadoop
```bash
# mkdir
master$ hdfs dfs -mkdir -p /user/root

# put
master$ hdfs dfs -put $HADOOP_HOME/LICENSE.txt /user/root/

# run wordcount
master$ hadoop jar $HADOOP_HOME/share/hadoop/mapreduce/hadoop-mapreduce-examples-3.2.1.jar wordcount /user/root /test_out

# check output file
master$ hdfs dfs -ls -R /test_out
master$ hdfs dfs -cat /test_out/part-r-00000
```
