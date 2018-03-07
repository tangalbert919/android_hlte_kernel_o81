#!/bin/bash

# ZyborgX build script
# Basically the LineageOS build script with a lot of upgrades.
#
# It is recommended that you modify this before running it, otherwise it will not work. This
# script was designed to be run from the AOSP source code.

UBERTC="/home/theidroid/Documents/arm-linux-androideabi-8.x/bin/arm-linux-androideabi-"

DEFAULT=$(pwd)/prebuilts/gcc/linux-x86/arm/arm-linux-androideabi-4.9/bin/arm-linux-androideabi-

LINARO="/home/theidroid/Documents/arm-linaro-toolchain/bin/arm-linux-gnueabi-"

KERNEL_DATE=`date +%Y%m%d`

export ARCH=arm
export CROSS_COMPILE="$UBERTC"

mkdir output

make -C $(pwd) O=output msm8974_sec_defconfig VARIANT_DEFCONFIG=lineage_hlte_bcm2079x_defconfig SELINUX_DEFCONFIG=selinux_defconfig
make -C $(pwd) O=output

# cp output/arch/arm/boot/Image $(pwd)/arch/arm/boot/zImage
cp output/arch/arm/boot/Image AnyKernel2/zImage

cd AnyKernel2/ && zip -r9 ZyborgX-hlte-$KERNEL_DATE.zip * -x README.md ZyborgX-hlte-$KERNEL_DATE.zip && cd ..
