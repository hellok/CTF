#!/usr/bin/env python2

import struct, os, sys

#f = open('fifo', 'w')

def send(cmd):
    global f
    sys.stdout.write(cmd)
    #f.write(cmd)
    #f.flush()
    sys.stdout.flush()

send('b')
s = 'd' * 28 + 's' * 3 + 'd' * 2 + 'w' * 5 + 'a' * 23 + 's' * 11 + 'd'* 27 + 'w' + 'w' * 3 + 'a' * 27 + 'w' * 5 + 'd' * 50 + 's' * 2 + 'a' * 38 + 's' * 11 + 'd' * 7 + 'w' * 7 + 'a' * 6 + 'w' * 9 + 'd' * 17 + 'd' * 2  + 'd' * 23 + 's' * 17 + 'd' * 6

send(s)

raw_input()
