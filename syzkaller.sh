#!/usr/bin/env bash

set -x

LINUX_PATH=linux-5.10.179

#git clone https://github.com/google/syzkaller.git
mkdir ${LINUX_PATH}/image
tar xvf syzkaller.tar.gz
cp syzkaller/tools/create-image.sh ${LINUX_PATH}/image/

sed -i 's|sudo .* debootstrap .*|\0 http://mirrors.ustc.edu.cn/debian|g' ${LINUX_PATH}/image/create-image.sh

cd ${LINUX_PATH}/image
./create-image.sh
cd -
