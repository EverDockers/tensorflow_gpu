# nvidia/cuda: 8.0-devel-ubuntu16.04
FROM nvidia/cuda:latest
MAINTAINER Baker Wang <baikangwang@hotmail.com>

ENV CUDNN_VERSION 6.0.21
LABEL com.nvidia.cudnn.version="${CUDNN_VERSION}"

#
# cudnn 6.0.21
#
RUN echo "deb http://developer.download.nvidia.com/compute/machine-learning/repos/ubuntu1604/x86_64 /" > /etc/apt/sources.list.d/nvidia-ml.list && \
    apt-get update && apt-get install -y --no-install-recommends \
                libcudnn6=$CUDNN_VERSION-1+cuda8.0 \
                libcudnn6-dev=$CUDNN_VERSION-1+cuda8.0 && \
    apt clean && \
    apt autoremove && \
    rm -rf /var/lib/apt/lists/*

ENV CUDA_HOME /usr/local/nvidia/
# For CUDA profiling, TensorFlow requires CUPTI.
ENV LD_LIBRARY_PATH /usr/local/cuda/extras/CUPTI/lib64:$LD_LIBRARY_PATH

#usage: docker run -it -v projects:/projects -p 6006:6006 baikangwang/tensorflow_gpu:tfonly
RUN apt update && \
    apt install -y --no-install-recommends apt-utils \
    # Developer Essentials
    git curl vim unzip wget && \
    #
    # Cleanup
    #
    apt clean && \
    apt autoremove && \
    rm -rf /var/lib/apt/lists/*
#
# Python 3.5
#
# For convenience, alisas (but don't sym-link) python & pip to python3 & pip3 as recommended in:
# http://askubuntu.com/questions/351318/changing-symlink-python-to-python3-causes-problems
RUN apt update && \
    apt install -y --no-install-recommends python3.5 python3.5-dev python3-pip && \
    pip3 install --no-cache-dir --upgrade pip setuptools && \
    echo "alias python='python3'" >> /root/.bash_aliases && \
    echo "alias pip='pip3'" >> /root/.bash_aliases && \
    #
    # Cleanup
    #
    apt clean && \
    apt autoremove && \
    rm -rf /var/lib/apt/lists/*

#
# Tensorflow 1.3.0 - GPU
#
#
RUN pip3 install --no-cache-dir --upgrade tensorflow-gpu

#
# Specify working folder
#
RUN mkdir /projects
WORKDIR "/projects"

#
# Tensorboard : 6006
#
EXPOSE 6006

CMD ["/bin/bash"]