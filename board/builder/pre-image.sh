#!/bin/sh

target_dir=$1

set_hostname()
{
    arch=`grep BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE ${BR2_CONFIG}  | cut -f2 -d.`
    hostname="q${arch}lin"
    echo $hostname
    echo $hostname > ${target_dir}/etc/hostname
}

add_host()
{
    ip=$1
    name=$2

    echo "${ip}  ${name}.kurwinet.pl ${name}" >> ${target_dir}/etc/hosts
}

create_hosts()
{
    hostname=`head -c -1 -q ${target_dir}/etc/hostname`
    echo "127.0.0.1  ${hostname}.kurwinet.pl ${hostname} localhost" > ${target_dir}/etc/hosts
    add_host "10.1.5.2" "qx32lin"
}

set_hostname
create_hosts

exit 0
