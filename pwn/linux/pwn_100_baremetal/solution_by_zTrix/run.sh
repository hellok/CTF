#!/bin/bash

die () {
    echo $1
    exit 10
}

gcc -m32 -c 1.s || die "gcc"
objcopy -O binary 1.o 1.bin || die "objcopy"

xxd 1.bin


