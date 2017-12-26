#!/bin/sh

target_dir=$1

hostname=`grep BR2_TARGET_GENERIC_HOSTNAME=\" ${BR2_CONFIG} | cut -f2 -d\"`
arch=`echo ${hostname} | cut -f2 -d-`
target=`echo ${hostname} | cut -f2- -d-`


echo "127.0.0.1  ${hostname}.kurwinet.pl ${hostname} localhost" > ${target_dir}/etc/hosts
echo "arch ${arch} 200" >> ${target_dir}/etc/opkg/opkg.conf
sed -i "s/\${HOSTNAME}/${hostname}/g" ${target_dir}/var/lib/buildbot/buildbot.tac
echo native-${target} >> ${target_dir}/etc/packages

exit 0
