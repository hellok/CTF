import sys
from Crypto.Cipher import AES

alph = [chr(i) for i in xrange(256)]
m = 'QUVTLTI1NiBFQ0IgbW9kZSB0d2ljZSwgdHdvIGtleXM='.decode('base64')
c = 'THbpB4bE82Rq35khemTQ10ntxZ8sf7s2WK8ErwcdDEc='.decode('base64')
flag = 's5hd0ThTkv1U44r9aRyUhaX5qJe561MZ16071nlvM9U='.decode('base64')
middle = dict();

for v in alph:
    x = v;
    print x.encode('hex')
    for v in alph:
        y = v;
        for v in alph:
            z = v;
            key1 = '%s%s%s%s' % ('\0' * 29, x, y, z)
            cipher = AES.new(key1)
            middle.update({cipher.encrypt(m): key1})

print "\nTable built...";

for v in alph:
    x = v;
    print x.encode('hex')
    for v in alph:
        y = v;
        for v in alph:
            z = v;
            key2 = '%s%s%s%s' % ('\0' * 29, x, y, z)
            cipher = AES.new(key2)
            d = cipher.decrypt(c)
            if d in middle:
                print "\nKeys found: %s; %s\nFlag:" % (middle[d].encode('hex'), key2.encode('hex'))
                cipher1 = AES.new(middle[d])
                print cipher.decrypt(cipher1.decrypt(flag))
