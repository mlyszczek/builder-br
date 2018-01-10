#!/bin/sh

target=`grep BR2_TOOLCHAIN_EXTERNAL_PREFIX=\" .config | cut -f2 -d\"`
kernel_path=/boot/qemu
kernel_version=`grep BR2_LINUX_KERNEL_VERSION .config | cut -f2 -d\"`
root_path=/var/diskless/images/bbs-${target}
root_server=root@kurwik

kernel=`ls -1 output/images | grep -i image`
dtb=`ls -1 output/images | grep .dtb`

if [ -z ${kernel} ]
then
    kernel="vmlinux"
fi

ssh ${root_server} "mkdir ${root_path}"
pv output/images/rootfs.ext2 | gzip | ssh ${root_server} "cd ${root_path}; zcat - > rootfs"
pv output/images/${kernel}   | gzip | ssh ${root_server} "cd ${root_path}; zcat - > kernel"

if [ ! -z "${dtb}" ]
then
    pv output/images/${dtb} | gzip | ssh ${root_server} "cd ${root_path}; zcat - > dtb"
fi

ssh ${root_server} "chown qemu:qemu -R ${root_path}"
ssh ${root_server} "chmod 770 ${root_path}"
ssh ${root_server} "chmod 660 ${root_path}/*"
