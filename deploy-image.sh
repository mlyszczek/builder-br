#!/bin/sh

target=`grep BR2_TOOLCHAIN_EXTERNAL_PREFIX=\" .config | cut -f2 -d\"`
kernel_path=/boot/qemu
kernel_version=`grep BR2_LINUX_KERNEL_VERSION .config | cut -f2 -d\"`
rootfs_path=/var/diskless/images/bbs-${target}
rootfs_server=root@kurwik
zimage=`ls -1 output/images | grep zImage`
dtb=`ls -1 output/images | grep .dtb`

echo "This is very-local script check paths before you continue! Will execute:"

echo -e "\tpv output/images/rootfs.tar | ssh ${rootfs_server} \"tar xf - -C ${rootfs_path}\""
echo -e "\tsudo cp output/images/${zimage} ${kernel_path}/bbs-${target}-${kernel_version}"

if [ ! -z "${dtb}" ]
then
    echo -e "\tsudo cp output/images/${dtb} ${kernel_path}/bbs-${target}-${kernel_version}.dtb"
fi


echo ""
echo "Hit enter if this looks good to you. Otherwise edit this scripts settings"

read

pv output/images/rootfs.tar | ssh ${rootfs_server} "tar xf - -C ${rootfs_path}"
sudo cp output/images/${zimage} ${kernel_path}/bbs-${target}-${kernel_version}
sudo chown qemu:qemu ${kernel_path}/bbs-${target}-${kernel_version}

if [ ! -z "${dtb}" ]
then
    sudo cp output/images/${dtb} ${kernel_path}/bbs-${target}-${kernel_version}.dtb
    sudo chown qemu:qemu ${kernel_path}/bbs-${target}-${kernel_version}.dtb
fi

