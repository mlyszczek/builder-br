#!/bin/sh

arch=`grep "BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE" .config | cut -f2 -d.`
kernel_path=/boot/qemu
kernel_version=`grep BR2_LINUX_KERNEL_VERSION .config | cut -f2 -d\"`
rootfs_path=/var/diskless/images/bbs-${arch}-linux
rootfs_server=root@kurwik


echo "This is very-local script check paths before you continue! Will execute:"

echo -e "\tpv output/images/rootfs.tar | ssh ${rootfs_server} \"tar xf - -C ${rootfs_path}\""
echo -e "\tsudo cp output/images/zImage ${kernel_path}/bbs-${arch}-linux-${kernel_version}"

echo ""
echo "Hit enter if this looks good to you. Otherwise edit this scripts settings"

read

pv output/images/rootfs.tar | ssh ${rootfs_server} "tar xf - -C ${rootfs_path}"
sudo cp output/images/bzImage ${kernel_path}/bbs-${arch}-linux-${kernel_version}
sudo chown qemu:qemu ${kernel_path}/bbs-${arch}-linux-${kernel_version}
