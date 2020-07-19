# Jupyter-Lab images
BASE: ```python:3.7.8-buster```  
Contains ```pandas```, ```numpy```, ```matplotlib```

## Tags
- ```py37```

## Usage
- ```Build``` in the project root directory containing ```requirements.txt```
```bash
$ docker build -t my-jupyter-lab:<tag> <path/to/Dockerfile>
```
- ```Run```
```bash
$ docker run -p <port>:8888 [-v <path/to/project/root>:/opt/jupyter] my-jupyter-lab:<tag>
```

OR

- Add ```Dockerfile``` & ```docker-compose``` in the project root directory containing ```requirements.txt```
- Up
```bash
$ docker-compose up
```

OR

- Pull & Run
```bash
$ docker pull jhleeeme/jupyter-lab:py37
$ docker run -p <port>:8888 [-v <path/to/project/root>:/opt/jupyter] [--name <container-name>] jhleeeme/jupyter-lab:py37
```
