
import PIL
from PIL import Image

img = Image.open('chess.png')
pixels = img.load()

w, h = img.size

a = []
z = set()

for i in range(0, w, 32):
    a.append([])
    for j in range(0, h, 32):
        p = pixels[j, i]
        a[i/32].append(p[0])
        z.add(p)

def tobin(s):
    x = bin(s)[2:]
    return '0' * (8-len(x)) + x

def tohex(s):
    return hex(s)[2:]

table = 'ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789+/'
print len(table)

ba = [0] * 40

for i in range(len(a)):
    for j in range(len(a[0])):
        x = a[i][j] / 5
        if x > 0:
            ba[x] = table[(7 - i) * 8 + j]

print ''.join(ba[1:37])
