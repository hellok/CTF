#!/bin/bash

die () {
    echo "fail"
    exit 10
}

gcc -c -Os -m32 32.s -o sc3_32.o || die
objcopy -O binary sc3_32.o sc3_32.bin || die
objdump -d sc3_32.o || die

gcc -g -m32 -Wl,-z,execstack test_shellcode.c || die
./a.out sc3_32.bin || die

