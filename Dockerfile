FROM nvidia/cuda:8.0-cudnn6-runtime-ubuntu16.04
MAINTAINER Baker Wang <baikangwang@hotmail.com>

#usage: docker run -it -v notebooks:/notebooks -p 6006:6006 baikangwang/tensorflow_cpu:tfonly
RUN apt update && \
    apt install -y --no-install-recommends apt-utils \
    # Developer Essentials
    git curl vim unzip wget
#
# Python 3.5
#
# For convenience, alisas (but don't sym-link) python & pip to python3 & pip3 as recommended in:
# http://askubuntu.com/questions/351318/changing-symlink-python-to-python3-causes-problems
RUN python3.5 python3.5-dev python3-pip && \
    pip3 install --no-cache-dir --upgrade pip setuptools && \
    echo "alias python='python3'" >> /root/.bash_aliases && \
    echo "alias pip='pip3'" >> /root/.bash_aliases && \
    #
    # Cleanup
    #
    apt clean && \
    apt autoremove && \
    rm -rf /var/lib/apt/lists/* && \

#
# Tensorflow 1.3.0 - GPU
#
#
RUN CUDA_HOME=/usr/local/nvidia && \
    export CUDA_HOME && \
    pip3 install --no-cache-dir --upgrade tensorflow-gpu && \
    #
    # Cleanup
    #
    apt clean && \
    apt autoremove && \
    rm -rf /var/lib/apt/lists/*

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