#!/bin/sh

configs=()
n=0
cd configs

###
# add all configs to array
#

for c in *
do
    if [ "${c}" = "packages.in" ]
    then
        continue
    fi

    configs+=($c)
done

###
# if config is not passed, print usage and list available configs
#

if [ $# -ne 2 ]
then
    echo "usage: ${0} <config_number> <host>"
    echo ""
    echo "host is friendly pc name where images will be hosted in qemu."
    echo "hostname of generated images will be {arch}-{host}-{linux}-{libc}"
    echo ""
    echo "Supported configs are:"

    for c in "${configs[@]}"
    do
        echo -e "\t$n) `echo $c | cut -f1 -d.`"
        ((n++))
    done

    exit $n
fi

cat ${configs[${1}]} packages.in > temp_defconfig
sed -i "/BR2_TARGET_GENERIC_HOSTNAME/s/builder/${2}/" temp_defconfig
sed -i "/BR2_TARGET_GENERIC_ISSUE/s/builder/${2}/" temp_defconfig
cd ..
make temp_defconfig
rm configs/temp_defconfig
