#!/bin/sh
set -x
apt-get -y install build-essential cmake libhidapi-dev
rm -rf TEMPered
git clone https://github.com/hughesr/TEMPered
cd TEMPered
git checkout 75aa1e2
cmake -DUTILS_USE_SHARED_LIB=off -DBUILD_STATIC_LIB=on -DBUILD_SHARED_LIB=off .
make tempered-exe
mv ./utils/tempered ..
