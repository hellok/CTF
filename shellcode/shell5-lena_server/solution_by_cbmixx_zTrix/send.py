#!/usr/bin/env python2

import os, sys, socket

HOST = 'lab.zwldl.com'
if len(sys.argv) > 2:
    HOST = sys.argv[2]
PORT = 12345
s = socket.socket()
s.connect((HOST, PORT))

f = open(sys.argv[1])

data = f.read()
print 'sending %d bytes' % len(data)

s.send(data)
print 'sent...'

s.shutdown(socket.SHUT_WR)
print s.recv(4096)

