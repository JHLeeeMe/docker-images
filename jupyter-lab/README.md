# JupyterLab images
from python:3.7.8-buster

## Tags
- ```py37```

## Usage
- Build & Run
```bash
$ docker build -t my-ubuntu:<tag> <path/to/Dockerfile>
$ docker run -it my-ubuntu:<tag>
```

OR

- Pull & Run
```bash
$ docker pull jhleeeme/ubuntu:<tag>
$ docker run -it [--name <container-name>] jhleeeme/ubuntu:<tag>
```
