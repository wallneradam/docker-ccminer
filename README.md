# CCMiner (tpruvot version) Docker builder

It is a Docker image builder for CCMiner based on NVidia Cuda 6.5.

## Prerequisistes

- Recent Linux operating system
- Recent version of Docker
- GIT
- Nvidia Docker: https://github.com/NVIDIA/nvidia-docker
- Some gigs of hardrive space

## Building

Edit cuda version of your GPU in `build.sh`. The default is 6.5 which is the minimum. (It is only tested with CUDA 6.5, higher versions may have other dependencies as well)

Then just start:

```bash
./build.sh
```

This will install all prerequisites in a container then build CCMiner. After run, the built program will be in the dist directory.

From the dist directory the script will create a runtime image, without the build toolchain of CUDA and GCC, which this way will be much smaller.

## Usage

```bash
nvidia-docker run --rm -t wallneradam/docker-ccminer ccminer --help
```
