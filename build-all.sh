#!/bin/sh

do_help()
{
    echo "usage ${0} [--missing] [--help] [host]"
    echo ""
    echo "where:"
    echo "  --missing       will only build missing image"
    echo "  --help          this help"
    echo "  host            friendly name of host image will be run at"
    exit 1
}

missing=0
host="kurwik"

while (( ${#} ))
do
    case "${1}" in
        --missing|-m) missing=1 ;;
        --help|-h) do_help ;;
        *) host="${1}" ;;
    esac

    shift
done

echo "host: ${host}; missing: ${missing}"

./create-config.sh > /dev/null
numbuilds=$?
mkdir -p images
make clean

for i in `seq 0 1 $((numbuilds - 1))`
do
    ./create-config.sh ${i} ${host}
    target=`grep BR2_TOOLCHAIN_EXTERNAL_PREFIX=\" .config | cut -f2 -d\"`
    dtb=`grep BR2_LINUX_KERNEL_INTREE_DTS_NAME=\" .config | cut -f2 -d\"`

    if ! mkdir images/bbs-${target}
    then
        # looks like build was already build

        if [ ${missing} -eq 1 ]
        then
            echo "build ${target} has been already built, skipping"
            continue
        fi
    fi

    make

    zimage=`ls -1 output/images | grep -i image`
    if [ -z ${zimage} ]
    then
        zimage="vmlinux"
    fi

    mv output/images/rootfs.ext2 images/bbs-${target}/rootfs
    mv output/images/${zimage}   images/bbs-${target}/kernel
    mv output/images/${dtb}.dtb  images/bbs-${target}/dtb

    make clean
done
