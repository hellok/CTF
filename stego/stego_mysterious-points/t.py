#!/usr/bin/env python

import os, sys, hashlib

def md5(s):
    m = hashlib.md5()
    m.update(s)
    return m.hexdigest()

def sha(s):
    m = hashlib.sha256()
    m.update(s)
    return m.hexdigest()

def check(s):
    target = 'b1b88cf63c08bcf9ee63b69f1e1cd2e1e1af961ce5cd2edf4a7b530535180fe8'
    if sha(s) == target:
        print s
        return True
    if sha(md5(s)) == target:
        print md5(s)
        return True
    if sha('ASIS_' + md5(s)) == target:
        print 'ASIS_' + md5(s)
        return True
    if sha('ASIS_' + s) == target:
        print 'ASIS_' + s
        return True
    return False

a = [0] * 9
a[0] = 'Ii'
a[1] = 'Ll'
a[2] = 'Oo'
a[3] = 'Vv'
a[4] = 'Ee'
a[5] = 'Hh'
a[6] = 'Ee'
a[7] = 'Rr'
a[8] = '\n'

import itertools

for i in itertools.product(*a):
    s = ''.join(i)
    if check(s):
        break

