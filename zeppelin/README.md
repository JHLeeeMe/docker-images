# Zeppelin images
BASE: ```jhleeeme/spark-2.4.0```

## Tags
- ```0.8.2```

## Usage
### 1. Run spark container
[spark README.md](https://github.com/JHLeeeMe/docker-images/tree/master/spark)

### 2. Run zeppelin container
```bash
docker run \
    -itd \
    --network <spark-network> \
    --name <container-name> \
    --ip <ip> \
    -p <local-port>:7777 \
    jhleeeme/zeppelin:0.8.2 \
    /bin/bash
```

### 3. Hello, zeppelin
connect localhost:<local-port> on web-browser
