# Spark images
BASE: ```jhleeeme/hadoop:3.2.1```  
Contains: ```scala```, ```sbt```, ```python3```

## Tags
- ```2.4.0```

## Usage
### 1. Build

**Build**
1. Download Dockfile & run-container.sh & config folder
```bash
# Execute run-container.sh
$ ./run-container.sh <number of slaves>

# e.g.
$ ./run-container.sh 3
  # create network & run master, slave
  > network-name = spark-cluster
  > master (10.0.0.10), slave-1 (10.0.0.11), slave-2 (10.0.0.12), slave-3 (10.0.0.13)
```

### 3. Start hadoop & spark
```bash
# check jps
master$ jps
master$ ssh <slave-N> '/opt/java/bin/jps'
```

### 4. Hello, spark-shell
```bash
# execute spark-shell
master$ spark-sehll
```
