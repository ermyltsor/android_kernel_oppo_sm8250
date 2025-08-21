#!/bin/bash

# Fake username
#export KBUILD_BUILD_USER= 

export CLANG_PATH=$HOME/clang-tools/bin
export PATH=$CLANG_PATH:$PATH
export CROSS_COMPILE=aarch64-linux-gnu-

# Create output directory
mkdir -p out

KERNEL_DEFCONFIG=vendor/kona-perf_defconfig

echo
echo "Kernel is going to be built using $KERNEL_DEFCONFIG."
echo

MAKE_FLAGS="ARCH=arm64 AR=llvm-ar CC=clang NM=llvm-nm OBJCOPY=llvm-objcopy OBJDUMP=llvm-objdump STRIP=llvm-strip LLVM=1 O=out"

make $MAKE_FLAGS $KERNEL_DEFCONFIG

make $MAKE_FLAGS -j$(nproc)

echo "Build Complete."
