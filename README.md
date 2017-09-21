# tensorflow (gpu)

repository: 

[`baikangwang/tensorflow_gpu`](https://hub.docker.com/r/baikangwang/tensorflow_gpu/)

tags:
> [`tfonly`,`latest`](#tfonly-latest)  
> [`jupyter`](#jupyter)

## `tfonly`, `latest`

### Description
this image is built based on nvidia/cuda:8.0-devel-ubuntu16.04 and provides fundamental developing environment of 
machine learning, `python`+`tensorflow`

### Docker Pull

```bash
docker pull baikangwang/tensorflow_gpu[:tfonly]
```

### Usage

```bash
nvidia-docker run -it --name <container name> -v <local working dir>:/projects -p <host port>:6006 baikangwang/tensorflow_gpu:tfonly [/bin/bash] 
```

### Dockerfile

<https://github.com/EverDockers/tensorflow_gpu/blob/tfonly/Dockerfile>

### Component

* nvidia-docker: 1.0
* cuda: 8.0.61
* cudnn: 6.0.21
* tensorflow: 1.3.0
* python: 3.5

## `jupyter`

### Description
this image is built based on baikangwang/tensorflow_gpu:tfonly and provides python development environment,
`python`+`tensorflow`+`jupyter`

### Docker Pull

```bash
docker pull baikangwang/tensorflow_gpu:jupyter
```

### Usage

```bash
nvidia-docker run -it --name <container name> -v <local working dir>:/projects -p <host port>:8888 baikangwang/tensorflow_gpu:jupyter [/bin/bash]
```

> NOTE: the default command is `/run_jupyter.sh --allow-root`, which will automatically launch jupyter notebook.
When create the container with a initial command as `/bin/bash`, should manually launch the jupyter notebook within
the container, `/run_jupyter.sh --allow-root`

### Dockerfile

<https://github.com/EverDockers/tensorflow_gpu/blob/jupyter/Dockerfile>

### Component

* nvidia-docker: 1.0
* cuda: 8.0.61
* cudnn: 6.0.21
* tensorflow: 1.3.0
* python: 3.5
* jupyter

