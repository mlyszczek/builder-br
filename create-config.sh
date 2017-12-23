#!/bin/sh

if [ $# -ne 1 ]
then
    echo "Supported configs are:"

    for f in configs/config.*
    do
        arch=`echo $f | cut -f2 -d.`
        echo -e "\t$arch"
    done

    exit 2
fi

cat configs/config.$1.in configs/common.in > .config
