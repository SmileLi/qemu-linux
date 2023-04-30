#!/bin/sh
wget http://ftp.sjtu.edu.cn/sites/ftp.kernel.org/pub/linux/kernel/v5.x/linux-5.10.179.tar.gz
tar -xzf ./linux-5.10.179.tar.gz
cd linux-5.10.179/
cp ../linux-config .config
make -j8
