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
    bison \
    ncurses-devel

sudo yum-config-manager --enable debug
sudo yum-builddep -y kernel
sudo debuginfo-install -y kernel

# development
sudo yum -y install git

# branch with patch applied to fix builds using a srpm on centos.
# Use this branch until https://github.com/dynup/kpatch/pull/490 is merged or
# addressed in some other way
git clone -b centos-kernel-package https://github.com/kragniz/kpatch.git
# git clone https://github.com/dynup/kpatch.git

pushd kpatch
make
sudo make install
popd

# clone development repos
git clone https://github.com/centos-livepatch/kpatch-package-builder.git
