#!/bin/bash

set -x

# sudo yum -y update

# kpatch dependencies
sudo yum -y install gcc kernel-devel elfutils elfutils-devel

# kpatch-build dependencies
sudo yum -y install \
    rpmdevtools \
    pesign \
    yum-utils \
    zlib-devel \
    binutils-devel \
    newt-devel \
    python-devel \
    perl-ExtUtils-Embed \
    audit-libs \
    audit-libs-devel \
    numactl-devel \
    pciutils-devel \
    bison

sudo yum-config-manager --enable debug
sudo yum-builddep -y kernel
sudo debuginfo-install -y kernel

# development
sudo yum -y install git
git clone https://github.com/dynup/kpatch.git
pushd kpatch
make
sudo make install
