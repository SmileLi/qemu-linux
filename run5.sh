#!/bin/sh
qemu-system-x86_64 -kernel ./linux-5.10.179/arch/x86/boot/bzImage -initrd ./initramfs.cpio.gz -append "nokaslr console=ttyS0" -nographic

