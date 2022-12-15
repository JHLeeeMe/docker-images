# Kafka-single-node images
BASE: ```jhleeeme/ubuntu:18.04```, ```alpine:latest```  
Contains: 
  - ubuntu: ```Java-1.8```, ```Scala-2.11.12```, ```Kafka_2.11-2.4.1```
  - alpine: ```Openjdk17```, ```Kafka_2.13-3.1.1```

## Tags
- ```2.11-2.4.1```
- ```2.13-3.1.1-alpine```

## Usage
### Pull & Run
1. Create docker network
```bash
$ docker network create --subnet 10.0.0.0/24 <network-name>

# network list
$ docker network ls
```

2. Pull & Run
```bash
$ docker pull jhleeeme/kafka-single-node:<tag>
$ docker run \
      -it \
      --name kafka-single-node \
      --ip <10.0.0.XX> \
      --network <network-name> \
      jhleeeme/kafka-single-node:<tag>

```

OR  

### Build & Exec script
1. Download Dockfile & Exec run-container.sh
```bash
# Execute run-container.sh
$ ./run-container.sh
```
