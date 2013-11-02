## protostar-net0

## 

```sh
from socket import *
import struct

s = socket(AF_INET, SOCK_STREAM)
s.connect(('192.168.119.128',2999))
str = s.recv(128)
print str
aaa=str[13:23]
print aaa
s.send(struct.pack("<I",int(aaa,10)))

print s.recv(128)
```