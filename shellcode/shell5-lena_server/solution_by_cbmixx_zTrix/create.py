#!/usr/bin/env python2

import os, sys, socket, struct, subprocess
from subprocess import *

shellcode = open(sys.argv[1]).read()

while len(shellcode) % 16 != 0:
    shellcode += '\x90'

l = len(shellcode)

shellcode = 'MARK' + struct.pack('<I', l) + shellcode

mar = ''

for i in range(0, len(shellcode), 16):
    p = Popen(['./ecc-liuchao'], stdin = PIPE, stdout=PIPE)
    #print repr(shellcode[i:i+16])
    p.stdin.write(shellcode[i:i+16])
    p.stdin.close()
    mar += p.stdout.read()

sys.stdout.write(mar)

