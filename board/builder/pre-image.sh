#!/bin/sh

target_dir=$1

hostname=`grep BR2_TARGET_GENERIC_HOSTNAME=\" ${BR2_CONFIG} | cut -f2 -d\"`
arch=`echo ${hostname} | cut -f2 -d-`
target=`echo ${hostname} | cut -f2- -d-`


echo "127.0.0.1  ${hostname}.kurwinet.pl ${hostname} localhost" > ${target_dir}/etc/hosts
echo "arch ${arch} 200" >> ${target_dir}/etc/opkg/opkg.conf
###
# change _ to - in for example x86_64 as opkg doesn't support _ in names
#
target=`echo ${target} | sed 's/_/-/'`
echo "native-${target}" >> ${target_dir}/etc/packages
echo "buildbot-slaves-${target}" >> ${target_dir}/etc/packages

exit 0
