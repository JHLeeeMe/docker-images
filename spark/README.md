# Spark images
BASE: ```jhleeeme/hadoop:3.2.1```  
Contains: ```scala```, ```sbt```, ```python3```

## Tags
- ```2.4.0```

## Usage
### 1. Pull or Build
**Pull**
1. Create docker network
```bash
$ docker network create --subnet 10.0.0.0/24 <network-name>

# network list
$ docker network ls
```

2. Pull & Run
```bash
$ docker pull jhleeeme/spark:2.4.0

# run master
$ docker run -itd --ip 10.0.0.<2~254> --network <network-name> --name master [-p <local-port>:8088] jhleeeme/spark:2.4.0 /bin/bash

# run slave
$ docker run -itd --ip 10.0.0.<2~254> --network <network-name> [--name <slave-name>] jhleeeme/spark:2.4.0 /bin/bash
$ docker run -itd --ip 10.0.0.<2~254> --network <network-name> [--name <slave-name>] jhleeeme/spark:2.4.0 /bin/bash
~~~~~
$ docker run -itd --ip 10.0.0.<2~254> --network <network-name> [--name <slave-name>] jhleeeme/spark:2.4.0 /bin/bash
```

OR  

**Build**
1. Download Dockfile & run-container.sh & config folder
```bash
# Execute run-container.sh
$ ./run-container.sh <number of slave-servers>

# e.g.
$ ./run-container.sh 3
  # create network & run master, slave
  > network-name = spark-cluster
  > master (10.0.0.10), slave-1 (10.0.0.11), slave-2 (10.0.0.12), slave-3 (10.0.0.13)
```

### 2. Modify config
```bash
# attach master
$ docker attach master

# modify workers & slaves
master$ cd /opt/hadoop/etc/hadoop
master$ sed 1d workers > tmp && mv tmp workers
master$ echo "<slave-name-1>" >> workers
master$ echo "<slave-name-2>" >> workers
~~~~~~~
master$ echo "<slave-name-N>" >> workers

master$ cp workers /opt/spark/conf/slaves
```

### 3. Start hadoop & spark
```bash
# start hdfs & yarn
master$ start-dfs.sh && start-yarn.sh

# start spark master & slaves
master$ start-master.sh && start-slaves.sh

# check jps
master$ jps
master$ ssh <slave-name> '/opt/java/bin/jps'
```

### 4. Hello, spark-shell
```bash
# mkdir
master$ hdfs dfs -mkdir -p /spark/shared-logs

# execute spark-shell
master$ spark-sehll
```
