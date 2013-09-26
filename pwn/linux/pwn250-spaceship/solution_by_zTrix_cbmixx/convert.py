#!/usr/bin/env python2
import sys

for l in sys.stdin:
    l = l.strip()
    assert(len(l) <= 4)
    sys.stdout.write(l.decode('hex'))
    if len(l) == 2:
        sys.stdout.write('\x90')
    sys.stdout.write('\xeb\x2c')
