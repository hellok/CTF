#!/usr/bin/env python2

import os, sys, PIL, random
from PIL import Image

f = open('img.encode').read()

di = {'\xff': (255, 255, 255)}

w = 300
h = len(f) / w
size = (w, h)

im = Image.new('RGB', size)

for i in range(len(f)):
    if not di.has_key(f[i]):
        di[f[i]] = (random.randint(0, 255), random.randint(0, 255), random.randint(0, 255))
        #di[f[i]] = (0, 0, 0)

print len(f), len(di)

for i in range(w):
    for j in range(h):
        p = i * w + j
        im.putpixel((i, j), di[f[p]])

im.save('out.png')
