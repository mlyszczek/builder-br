#!/bin/sh

target_dir=$1

arch=`grep BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE ${BR2_CONFIG}  | cut -f2 -d.`


set_hostname()
{
    hostname="bbs-${arch}-linux"
    echo $hostname
    echo $hostname > ${target_dir}/etc/hostname
}

create_hosts()
{
    hostname=`head -c -1 -q ${target_dir}/etc/hostname`
    echo "127.0.0.1  ${hostname}.kurwinet.pl ${hostname} localhost" > ${target_dir}/etc/hosts
    echo "10.1.1.1   kurwik.kurwinet.pl kurwik" >> ${target_dir}/etc/hosts
    echo "10.1.1.1   kurwinet.pl" >> ${target_dir}/etc/hosts
}

update_opkg_with_arch()
{
    echo "arch ${arch} 200" >> ${target_dir}/etc/opkg/opkg.conf
}

set_hostname
create_hosts
update_opkg_with_arch

exit 0
