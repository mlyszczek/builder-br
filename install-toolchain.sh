#!/bin/sh

gcc_target=`grep BR2_GCC_TARGET_ARCH .config | cut -f2 -d\"`
toolchain_dir=/home/mlyszczek/x-tools

cp -r ${toolchain_dir}/HOST-${gcc_target}-builder-linux-gnu/* output/target/usr/native-compiler
