import hashlib
import time
h = {}
nr = 0
print "Hashing..."
f = open('wikipedia-wordlist-sraveau-20090325.txt')
for line in f:
    line = line.strip()
    print line
    x = hashlib.md5(line).hexdigest()
    w = x[:13]
    #print w,x
    #time.sleep(2)
    h[w] = line
    nr += 1
    if (nr % 10000) == 0:
        print nr
        break
print "Done"
while True:
    f = raw_input()
    print h.get(f,'Not found')