# Kafka-single-node images
BASE: ```jhleeeme/ubuntu:18.04```  
Contains: ```Java-1.8```, ```Scala-2.11.12```, ```Kafka_2.11-2.4.1```

## Tags
- ```2.11-2.4.1```

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
$ docker pull jhleeeme/kafka-single-node:2.11-2.4.1
$ docker run \
      -it \
      --name kafka-single-node \
      --ip <10.0.0.XX> \
      --network <network-name> \
      jhleeeme/kafka-single-node:2.11-2.4.1

```

OR  

Build
1. Download Dockfile & run-container.sh
```bash
# Execute run-container.sh
$ ./run-container.sh
```
