#!/bin/sh

common()
{
    sed -n "/# $1/,/# $2/p" .config >> configs/common.in
}

arch()
{
    sed -n "/# $1/,/# $2/p" .config >> configs/config.${a}.in
}

a=`grep "BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE" .config | cut -f2 -d.`
echo > configs/common.in
echo > configs/config.${a}.in

common "Automatically generated file; DO NOT EDIT" "Target options"
common "Build options" "Toolchain"
common "System configuration" "Kernel"
grep -A99999 "# Target packages" .config >> configs/common.in
grep -v "Buildroot 2017.11" configs/common.in > configs/common.in.new
mv configs/common.in.new configs/common.in

arch "Target options" "Build options"
arch "Toolchain" "System configuration"
arch "Kernel" "Target packages"
