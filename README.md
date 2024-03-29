# docker-images

## Ubuntu
Contains ```vim```, ```curl```  
README: [ubuntu/README.md](https://github.com/JHLeeeMe/docker-images/tree/master/ubuntu)

### Tags
- [20.04](https://github.com/JHLeeeMe/docker-images/tree/master/ubuntu/20.04)
- [18.04](https://github.com/JHLeeeMe/docker-images/tree/master/ubuntu/18.04)
- [16.04](https://github.com/JHLeeeMe/docker-images/tree/master/ubuntu/16.04)

## Jupyter-Lab
BASE: ```python:3.7.8-buster```  
Contains ```pandas```, ```numpy```, ```matplotlib```  
README: [jupyter-lab/README.md](https://github.com/JHLeeeMe/docker-images/tree/master/jupyter-lab)

### Tags
- [py37](https://github.com/JHLeeeMe/docker-images/tree/master/jupyter-lab/py37)

## Hadoop
BASE: ```jhleeeme/ubuntu:18.04```  
README: [hadoop/README.md](https://github.com/JHLeeeMe/docker-images/tree/master/hadoop)

### Tags
- [3.2.1](https://github.com/JHLeeeMe/docker-images/tree/master/hadoop/3.2.1)

## Spark
BASE: ```jhleeeme/hadoop:3.2.1```  
README: [spark/README.md](https://github.com/JHLeeeMe/docker-images/tree/master/spark)

### Tags
- [2.4.0](https://github.com/JHLeeeMe/docker-images/tree/master/spark/2.4.0)

## Zeppelin
BASE: ```jhleeeme/spark:2.4.0```  
README: [zeppelin/README.md](https://github.com/JHLeeeMe/docker-images/tree/master/zeppelin)

### Tags
- [0.8.2](https://github.com/JHLeeeMe/docker-images/tree/master/zeppelin/0.8.2)

## Kafka-single-node
BASE: ```jhleeeme/ubuntu:18.04```, ```alpine:latest```  
README: [kafka-single-node/README.md](https://github.com/JHLeeeMe/docker-images/tree/master/kafka-single-node)

### Tags
- [2.11-2.4.1](https://github.com/JHLeeeMe/docker-images/tree/master/kafka-single-node/2.11-2.4.1)
- [2.13-3.1.1-alpine](https://github.com/JHLeeeMe/docker-images/tree/master/kafka-single-node/2.13-3.1.1-alpine)
