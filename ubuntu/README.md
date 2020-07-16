# Ubuntu images
with vim, curl

## Tags
- 20.04
- 18.04
- 16.04

## Usage
Build & Run
- Build
```bash
$ docker build -t my-ubuntu:<tag> .
```

- Run
```bash
$ docker run -it my-ubuntu:<tag>
```

OR

```bash
$ docker pull jhleeeme/ubuntu:<tag>
$ docker run -it [--name <container-name>] jhleeeme/ubuntu:<tag>
```
