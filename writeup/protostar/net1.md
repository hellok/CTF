## protostar-net1

## 

```sh
from socket import *
from struct import *
import time

s = socket(AF_INET, SOCK_STREAM)
s.connect(("192.168.119.128", 2998))
data = s.recv(1024)
num = unpack("<I", data)[0]
print num
s.send(str(num))
print s.recv(1024)
s.close()
time.sleep(10)

```