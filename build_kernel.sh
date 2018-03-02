#!/bin/bash

# ZyborgX build script
# Basically the LineageOS build script with a lot of upgrades.

# It is recommended that you modify this before running it, otherwise it will not work.

UBERTC="/home/theidroid/Documents/arm-linux-androideabi-8.x/bin/arm-linux-androideabi-"

DEFAULT="/home/theidroid/Android/Sdk/ndk-bundle/toolchains/arm-linux-androideabi-4.9/prebuilt/linux-x86_64/bin/arm-linux-androideabi-"

KERNEL_DATE=`date +%Y%m%d`

export ARCH=arm
export CROSS_COMPILE="$DEFAULT"

mkdir output

make -C $(pwd) O=output msm8974_sec_defconfig VARIANT_DEFCONFIG=lineage_hlte_bcm2079x_defconfig SELINUX_DEFCONFIG=selinux_defconfig
make -j64 -C $(pwd) O=output

# cp output/arch/arm/boot/Image $(pwd)/arch/arm/boot/zImage
cp output/arch/arm/boot/Image AnyKernel2/zImage

cd AnyKernel2/ && zip -r9 ZyborgX-hlte-$KERNEL_DATE.zip * -x README.md ZyborgX-hlte-$KERNEL_DATE.zip && cd ..
