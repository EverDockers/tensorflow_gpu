FROM baikangwang/tensorflow_gpu:jupyter
MAINTAINER Baker Wang <baikangwang@hotmail.com>

# the development environment for the project EMNIST <https://github.com/baikangwang/EMNIST>

# usage: docker run -it -v projects:/projects -p 8888:8888 6006:6006 5000:5000 baikangwang/tensorflow_gpu:emnist

#
# environment
#
RUN pip3 --no-cache-dir install keras h5py flask && \

    pip3 --no-cache-dir install --upgrade scipy

#
# server port
#
EXPOSE 5000

CMD ["/bin/bash"]
