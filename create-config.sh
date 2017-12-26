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

if [ $# -ne 1 ]
then
    echo "usage: ${0} <config_number>"
    echo""
    echo "Supported configs are:"

    for c in "${configs[@]}"
    do
        echo -e "\t$n) `echo $c | cut -f1 -d.`"
        ((n++))
    done

    exit $n
fi

cat ${configs[${1}]} packages.in > temp_defconfig
cd ..
make temp_defconfig
rm configs/temp_defconfig
