#!/bin/sh

target_dir=$1

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

sed -i -e 's/\/bin\/sh/\/bin\/zsh/' $target_dir/etc/passwd

create_hosts

exit 0
