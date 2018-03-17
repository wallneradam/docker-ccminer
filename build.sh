#!/bin/bash

### Parameters ###

CUDA_VERSION=6.5
IMAGE_NAME="wallneradam/docker-ccminer"

##################

### Inside Docker ###

if [ "$1" == "_docker_" ]; then
    uid="$2"

    # Install toolchain and build
    apt-get update \
        && apt-get -y install \
            autoconf libcurl4-openssl-dev git build-essential libssl-dev \
        && cd /opt/ccminer \
        && ./autogen.sh \
        && ./configure --prefix=/ccminer \
        && make -j8 \
        && make install \
        && strip /ccminer/bin/ccminer \
        && chown -R $uid /ccminer \
        && exit 0

    # If error
    exit 1
fi

### Outside Docker ###

# Download latest ccminer from GIT
[ ! -d ccminer ] && git pull https://github.com/tpruvot/ccminer.git

# Install in CUDA devel container and create a new image
nvidia-docker run -ti \
    --rm \
    --name ccminer-builder \
    --hostname ccminer-builder \
    -v $PWD/ccminer:/opt/ccminer \
    -v $PWD/dist:/ccminer \
    -v $PWD/build.sh:/opt/build.sh \
    nvidia/cuda:${CUDA_VERSION}-devel \
    /opt/build.sh _docker_ $UID \
&& docker build --rm -t ${IMAGE_NAME}:latest .
