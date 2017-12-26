#!/bin/sh

make savedefconfig
target=`grep BR2_TOOLCHAIN_EXTERNAL_CUSTOM_PREFIX=\" .config | cut -f2 -d\"`
cd configs

grep "BR2_PACKAGE_" temp_defconfig > packages.in
grep -v "BR2_PACKAGE_" temp_defconfig > ${target}.in
rm temp_defconfig
