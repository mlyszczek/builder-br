#!/bin/sh

target_dir=$1

hostname=`grep BR2_TARGET_GENERIC_HOSTNAME=\" ${BR2_CONFIG} | cut -f2 -d\"`
arch=`echo ${hostname} | cut -f2 -d-`
target=`echo ${hostname} | cut -f2- -d-`

compiler="$(echo ${target} | cut -d- -f1)"
compiler+="-builder-"
compiler+="$(echo ${target} | cut -d- -f3-)"

# install includes as they are build dependencies for packages we test
mkdir "${target_dir}/usr/include"
cp "${STAGING_DIR}/usr/include/rb.h" "${target_dir}/usr/include"
cp "${STAGING_DIR}/usr/include/embedlog.h" "${target_dir}/usr/include"

echo "127.0.0.1  ${hostname}.kurwinet.pl ${hostname} localhost" > ${target_dir}/etc/hosts
echo "arch ${arch} 200" >> ${target_dir}/etc/opkg/opkg.conf

###
# create muque mount point
#

echo "none            /dev/mqueue     mqueue  defaults        0       0" >> \
    ${target_dir}/etc/fstab

###
# change _ to - in for example x86_64 as opkg doesn't support _ in names
#
target=`echo ${target} | sed 's/_/-/'`
compiler=`echo ${compiler} | sed 's/_/-/'`

echo "buildbot-slaves-${target}" >> ${target_dir}/etc/packages
echo "native-${compiler}" >> ${target_dir}/etc/packages
exit 0
