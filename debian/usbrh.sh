#!/bin/sh
set -x
apt-get -y install build-essential libhidapi-dev
rm -rf usbrh-main
git clone https://github.com/stzlab/usbrh.git usbrh-main
cd usbrh-main
make
mv ./usbrh ..
