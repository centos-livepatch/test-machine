#!/bin/bash

# kpatch dependencies
sudo yum install gcc kernel-devel elfutils elfutils-devel

# kpatch-build dependencies
sudo yum install \
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
sudo yum-builddep kernel
sudo debuginfo-install kernel

# cache compilation
sudo yum install ccache
ccache --max-size=5G
