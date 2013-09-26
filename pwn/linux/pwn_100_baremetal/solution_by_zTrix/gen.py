#!/usr/bin/env python2

import os, sys, subprocess

s = ''

for i in range(1, 256):
    s = chr(i) + '\x47\xff\xe7\x00\x00\x00\x00'

    f = open('test', 'w')
    f.write(s)
    f.close()

    stdout = subprocess.check_output(['objdump', '-m', 'i386', '-b', 'binary', '-D', './test'])
    print stdout
    raw_input('================ press enter to continue:')
