#!/usr/bin/python2
import hashlib, string, sys

def xor(a, b):
    l = min(len(a), len(b))
    return ''.join([chr(ord(x) ^ ord(y)) for x, y in zip(a[:l], b[:l])])

def h(x):
    x = hashlib.sha256(x).digest()
    x = xor(x[:16], x[16:])
    return x

inp = open('msg002.enc').read()
msg = inp.decode('base64')
k = xor(msg[:16], 'From: Vlugge Jap')

out = ''
for i in xrange(0, len(msg), 16):
    out += xor(msg[i:i+16], k)
    k = h(k + str(len(msg)))

print out
