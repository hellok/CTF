## protostar-net2

## 

```sh
from socket import *
from struct import *
import time

s = socket(AF_INET, SOCK_STREAM)
s.connect(("192.168.119.128", 2997))

aaa = 0
for i in range(4):
  data = s.recv(4)
  aaa += int(unpack("<I", data)[0])

ans = pack("<I", aaa)
print aaa
s.send(ans)
print s.recv(1024)
s.close()
time.sleep(10)

```