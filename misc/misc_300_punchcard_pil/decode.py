#!/usr/bin/env python2

import  os, sys
from PIL import Image
from code import trans

def read(png):
    img = Image.open(png)
    pixels = img.load()
    w, h = img.size
    line = ''
    for x in range(86, 724, 8):
        digits = []
        for y in range(52, 346, 26):
            if pixels[x, y] == (255, 255, 255, 255):
                digits.append((y - 52) / 26)
        k = ','.join(map(lambda _:str(_), digits))
        if not trans.has_key(k):
            print 'not found: ', x, k
            sys.exit(10)
        line += trans[k]
    return line

print read(sys.argv[1])