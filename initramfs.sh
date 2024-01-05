#!/bin/bash
mkdir initramfs
cd initramfs/

cp -rf ../busybox-1.32.1/_install/* ./
ln -s bin/busybox init
mkdir -pv {bin,sbin,etc,proc,sys,usr/{bin,sbin},dev,mnt,tmp,home}
cd ./etc
# vim inittab

cat <<- EOF > inittab
::sysinit:/etc/init.d/rcS
::askfirst:-/bin/sh
::restart:/sbin/init
::ctrlaltdel:/sbin/reboot
::shutdown:/bin/umount -a -r
::shutdown:/sbin/swapoff -a
EOF

chmod +x inittab

mkdir init.d

cat <<- EOF > init.d/rcS
#!/bin/sh
mount proc
mount -o remount,rw /
mount -a
clear
echo "My Linux Starting, press enter to active"
EOF

chmod +x init.d/rcS

# vim ./fstab

cat <<- EOF > ./fstab
proc		/proc	proc		defaults	0	0
sysfs 		/sys	sysfs		defaults	0	0
devtmpfs	/dev	devtmpfs	defaults	0	0
EOF

cd ..
find . -print0 | cpio --null -ov --format=newc | gzip -9 > ../initramfs.cpio.gz
cd ..
ls | grep 'initramfs' | grep -v "initramfs.sh"
