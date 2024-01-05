#!/bin/sh

LINUX_PATH=linux-5.10.179
qemu-system-x86_64 \
-kernel ./${LINUX_PATH}/arch/x86/boot/bzImage \
-append "nokaslr console=ttyS0 root=/dev/sda earlyprintk=serial" \
-hda ./linux-4.9.301/image/buster.img \
-net user,hostfwd=tcp::10021-:22 -net nic \
--enable-kvm \
-nographic \
-m 2G \
-smp 2 \
-pidfile vm.pid \
2>&1 | tee vm.log
