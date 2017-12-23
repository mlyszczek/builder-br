#!/bin/sh

arch=`grep "BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE" .config | cut -f2 -d.`
toolchain_dir=/usr/native-toolchain

echo "copying toolchain"
cp -r ${toolchain_dir} output/target/usr

echo "fixing paths"
sed -i 's/\/usr\/toolchain-build\/\.build\/tools//g' output/target/${toolchain_dir}/bin/libtool
sed -i 's/\/usr\/toolchain-build\/\.build\/tools//g' output/target/${toolchain_dir}/bin/libtoolize
sed -i 's/\/usr\/toolchain-build\/\.build\/HOST-i686-builder-linux-gnu\/i686-builder-linux-gnu\/buildtools/\/usr\/native-toolchain/g' output/target${toolchain_dir}/bin/auto* output/target${toolchain_dir}/bin/libtool

tools="addr2line ar as c++ c++filt cc cpp \
    elfedit g++ gcc gcc-6.4.0 gcc-ar gcc-nm gcc-ranlib \
    gcov gcov-dump gcov-tool gdb gprof ld ld.bfd ldd nm \
    objcopy objdump populate ranlib readelf size strings strip"

for t in $tools
do
    ln -fs "${arch}-builder-linux-gnu-${t}" output/target/${toolchain_dir}/bin/${t}
done

echo "fixing permissions"
chmod a+rX output/target/usr/native-toolchain -R
