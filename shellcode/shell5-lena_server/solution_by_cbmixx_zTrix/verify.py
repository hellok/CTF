#!/usr/bin/env python2

import os, sys, PIL
from PIL import Image

if len(sys.argv) < 3:
    print 'usage: %s <1.bmp> <out.bmp>'
    sys.exit(0)

im = Image.open(sys.argv[1])
out = Image.open(sys.argv[2])

im.load()
imr, img, imb = im.split()

bits_ary = map(lambda _: bin(ord(_))[2:], shellcode)

bits = []
for i in bits_ary:
    bits.append('0' * (8 - len(i)) + i)

while len(bits) % 24 != 0:
    bits.append('0')

l = len(bits)

bits_per_row = 0x200/8 * 3

row = l / bits_per_row

if l % bits_per_row != 0:
    row += 1

col = 0x200 / 8 if l >= bits_per_row else l / 3

m = Image.new('RGB', (col * 8, row * 8))

for x in range(row):
    for y in range(col):
        r = bits.pop()
        g = bits.pop()
        b = bits.pop()
        
        rr = imr if r == '1' else img
        gg = imr if g == '1' else img
        bb = imr if b == '1' else img

        p = Image.merge('RGB', (rr, gg, bb))
        m.paste(p, (y * 8, x * y))

m.save('out.bmp')

