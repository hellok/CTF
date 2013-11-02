## protostar-net3

## 

```sh
from socket import *
from struct import *
import time

s = socket(AF_INET, SOCK_STREAM)
s.connect(("192.168.119.128", 2996))
login = "\x17"\
     "\x05net3\x00"\
     "\x0dawesomesauce\x00"\
     "\x0apassword\x00"
	 
tmp = len(login)
s.send(pack(">H", tmp))
s.send(login)
 
print s.recv(1024)
time.sleep(10)

```