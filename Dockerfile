FROM ubuntu:22.04

WORKDIR /home

# SKIPS TIMEZONE
ENV DEBIAN_FRONTEND=noninteractive  		

# INSTALL PREREQUISITES 
RUN apt-get update && apt-get install -y adb \
  acpica-tools \
  autoconf \
  automake \
  bc \
  bison \
  build-essential \
  ccache \
  cscope \
  curl \
  device-tree-compiler \
  e2tools \
  expect \
  fastboot \
  flex \
  ftp-upload \
  gdisk \
  libattr1-dev \
  libcap-dev \
  libfdt-dev \
  libftdi-dev \
  libglib2.0-dev \
  libgmp3-dev \
  libhidapi-dev \
  libmpc-dev \
  libncurses5-dev \
  libpixman-1-dev \
  libslirp-dev \
  libssl-dev \
  libtool \
  libusb-1.0-0-dev \
  make \
  mtools \
  netcat \
  ninja-build \
  python3-cryptography \
  python3-pip \
  python3-pyelftools \
  python3-serial \
  python-is-python3 \
  rsync \
  swig \
  unzip \
  uuid-dev \
  xdg-utils \
  xterm \
  xz-utils \
  zlib1g-dev
  
 
# INSTALL AND SETUP GIT
RUN apt-get install -y git 
RUN git config --global user.name optee && git config --global user.email optee@example.com


# REQUIRED FOR THE MAKEFILE
RUN apt-get install -y wget && apt-get install -y cpio


# CREATE OPTEE DEVELOPMENT ENVIRONMENT 
RUN apt-get install -y repo
RUN mkdir optee && cd optee 
RUN repo init -u https://github.com/OP-TEE/manifest.git -m qemu_v8.xml 
RUN repo sync 
RUN cd build && make toolchains 
RUN make run
  

