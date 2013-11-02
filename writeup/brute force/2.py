import hashlib
import time
import os,sys

def getsha1(aaa):
    sha1obj = hashlib.sha1()
    sha1obj.update(aaa)
    hash = sha1obj.hexdigest()
    return hash

def getsha256(aaa):
    sha256obj = hashlib.sha256()
    sha256obj.update(aaa)
    hash = sha256obj.hexdigest()
    return hash

h = {}
nr = 0
print "Hashing..."
f = open('wikipedia-wordlist-sraveau-20090325.txt')#http://www.hack3r.com/wordlists/wikipedia-wordlist-sraveau-20090325.txt.bz2
#for line in f:
#    line = line.strip()
    #print line
line=''
for i in range(1000000,9999999):
    line = str(i)
    x = hashlib.md5(line).hexdigest()
    w = x[30:32]
    #print w,x
    if w=='5a':
	  d = getsha1(line)[0:2]
	  if d == 'f1':
	      x = getsha256(line)[30:32]
              if x == '91':
                     print line
                     if len(line)==7:
                      print "gotit:",line,repr(line)
                      break

print "Done"
while True:
    f = raw_input()
    print h.get(f,'Not found')
