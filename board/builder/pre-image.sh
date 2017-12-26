#!/bin/sh

target_dir=$1

target=`grep BR2_TOOLCHAIN_EXTERNAL_PREFIX=\" ${BR2_CONFIG}  | cut -f2 -d\"`
arch=`echo ${target} | cut -f1 -d-`
hostname="bbs-${target}"


echo $hostname > ${target_dir}/etc/hostname
echo "127.0.0.1  ${hostname}.kurwinet.pl ${hostname} localhost" > ${target_dir}/etc/hosts
echo "arch ${arch} 200" >> ${target_dir}/etc/opkg/opkg.conf
sed -i "s/\${TARGET}/${target}/g" ${target_dir}/var/lib/buildbot/buildbot.tac

exit 0
