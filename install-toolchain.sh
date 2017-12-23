#!/bin/sh

arch=`grep "BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE" .config | cut -f2 -d.`
toolchain_dir=/home/mlyszczek/x-tools

cp -r ${toolchain_dir}/HOST-${arch}-builder-linux-gnu/* output/target/usr/native-compiler
