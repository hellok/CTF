#!/usr/bin/python

import SocketServer, os, sys
import base64, random, hashlib

def strToInt(str):
    j=0
    i=0
    for char in str[::-1]:
        j+=ord(char)<<(i*8)
        i+=1
    return j

def intToStr(i):
    s=""
    while i >0:
        s+=chr(i&0xff)
        i=i>>8
    return s[::-1]

SAFEPRIME = 27327395392065156535295708986786204851079528837723780510136102615658941290873291366333982291142196119880072569148310240613294525601423086385684539987530041685746722802143397156977196536022078345249162977312837555444840885304704497622243160036344118163834102383664729922544598824748665205987742128842266020644318535398158529231670365533130718559364239513376190580331938323739895791648429804489417000105677817248741446184689828512402512984453866089594767267742663452532505964888865617589849683809416805726974349474427978691740833753326962760114744967093652541808999389773346317294473742439510326811300031080582618145727L
# generated with gensafeprime.generate(2048)
# https://pypi.python.org/pypi/gensafeprime

def genprimroot(p):
    n = 2
    while True:
        if pow(n, (p-1)/2, p) == 1:
            n = n+1
        else:
            return n

def elgamal_genkey():
    p = SAFEPRIME
    g = genprimroot(p)
    x = random.randrange(1, p-1)
    if x%2 == 0:
        x = x+1 # h should be a generator
    h = pow(g, x, p)
    return (p, g, h, x)

def elgamal_check(p, m):
    if m <= 0:
        return False
    elif m >= p:
        return False
    else:
        return True

def elgamal_encrypt(p, g, h, m):
    y = random.randrange(1, p) # Don't pick 0
    c1 = pow(g, y, p)
    s = pow(h, y, p)
    c2 = s * m % p
    return (c1, c2)

def elgamal_decrypt(p, g, x, c):
    (c1, c2) = c
    s = pow(c1, p-x, p) # Thank you, Lagrange!
    m = c2 * s % p
    return m


class ServerHandler(SocketServer.BaseRequestHandler):

    def fail(self, message):
        self.request.sendall(message + "\nGood-bye.\n")
        self.request.close()
        return False


    def captcha(self):
        proof = base64.b64encode(os.urandom(9))
        self.request.sendall("""\
Are you human?  Then prove it.  Give me a string of length 20 that starts with
'%s' and whose SHA1 ends in 0xFFFFFF
"""%(proof))
        test = self.request.recv(20)
        ha = hashlib.sha1()
        ha.update(test)
        if test[0:12]!=proof or not ha.digest().endswith('\xFF\xFF\xFF'):
            print "bad hash"
            return False
        else:
            return True

    
    def handle(self):
        
        if not self.captcha():
            return self.fail("You're a robot!")

        (p, g, h, x) = elgamal_genkey()

        self.request.sendall("""
I bet you can't break my encryption.  Give me two messages: I'll encrypt one
of them at random and give you the encryption, and you'll tell me which one it
is.  Can you get it right 64 times in a row?

All messages are integers mod the modulus.  The prime modulus, generator, and
public key are:
  p = [%i]
  g = [%i]
  h = [%i]

Say "Ready" to continue.  Or whatever, I'm totally not going to pay attention
to what you actually say.

"""%(p, g, h))

        self.request.recv(100)

        for x in range(64):
            self.request.sendall("Send me two integers with a space in the middle.\n")
            msgs = self.request.recv(5000).split(" ")
            if len(msgs)!=2:
                return self.fail("You have to send exactly two integers.")

            r = random.randrange(2)
            m = int(msgs[r])
            if not elgamal_check(p, m):
                return self.fail("Urgh!  That integer was too big, I almost choked!")

            c = elgamal_encrypt(p, g, h, m)
            self.request.sendall("""\
The ciphertext is (%i, %i).
Choose 0 if it's the first message or 1 if it's the second.
"""%c)
            resp = self.request.recv(100)
            if resp[0] != str(r):
                return self.fail("Hah!  You can't beat me!")


        self.request.sendall("Augh!  I lose, again!\n" + KEY)
        self.request.close()

class ThreadedServer(SocketServer.ThreadingMixIn, SocketServer.TCPServer):
    pass

KEY = ""

if __name__ == "__main__":
    HOST = sys.argv[1]
    PORT = int(sys.argv[2])

    KEY = open('key.txt', 'r').read()

    server = ThreadedServer((HOST, PORT), ServerHandler)
    server.allow_reuse_address = True
    server.serve_forever()




