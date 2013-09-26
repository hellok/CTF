#first save the flags and a temp register
switch $fr
switch $r15
switch $r14
switch $r13

#check for the syscall that came in
test $sr
jmpif null, Reset

#make sure we have a safe sp
switch $sp
movu $sp, StackEnd
movl $sp, StackEnd
pushw $s1
pushw $s2

#check for intercepted syscalls
mov $r15, 3
cmp $r15, $sc
jmpif eq, UnsaveSyscall

mov $r15, 10
cmp $r15, $sc
jmpif eq, UnsaveSyscall

mov $r15, 15
cmp $r15, $sc
jmpif eq, UnameSyscall
#its a save syscall

#restore the saved registers
PassSyscall:
popw $s2
popw $s1
switch $fr
switch $r15
switch $r14
switch $r13
switch $sp
syscall
sysret

UnsaveFile:
dataw 0

UnsaveSyscall:
#its an unsave syscall, we have to check if we want to make it fail (s1 contains a file id)

movu $r15, UnsaveFile
movl $r15, UnsaveFile
loadw $r15, $r15
cmp $r15, $s1
jmpif eq, FailedSyscall
jmp PassSyscall

ReturnSyscall:
popw $s2
popw $s1
switch $fr
switch $r15
switch $r14
switch $r13
switch $sp
sysret

FailedSyscall:

#print access forbidden
movu $r15, AccessForbiddenMsg
movl $r15, AccessForbiddenMsg
call PrintString

#set return status to -1
movu $sr, 255
movl $sr, 255

#return to userspace
jmp ReturnSyscall

#Uname syscall
UnameSyscall:
movu $r15, UnameStr
movl $r15, UnameStr
call CopyToUserspace
jmp ReturnSyscall

Reset:
#we want to reset the whole vm and start cmd
movu $r15, WelcomeMsg
movl $r15, WelcomeMsg
call PrintString

#setup the bios barrier
movu $s1, EndOfBios
movl $s1, EndOfBios
mov $sc, 13
syscall

#search the hidden file

movu $s1, UnsaveFileName
movl $s1, UnsaveFileName
mov $sc, 11
syscall

#save the hidden file id
movu $r15, UnsaveFile
movl $r15, UnsaveFile
storw $r15, $sr

#find & open cmd
movu $s1, CmdPath
movl $s1, CmdPath
mov $sc, 11
syscall
test $sr
jmpif signed, ResetError
mov $s1, $sr
mov $sc, 3
syscall
test $sr
jmpif signed, ResetError
mov $s1, $sr

#make space for cmd
movu $r15, 16
movl $r15, 0
sub $sp, $sp, $r15
mov $r15, $sp

#copy byte for byte to $sp
ResetLoadByte:
mov $sc, 5
syscall

test $sr
jmpif signed, ResetDone

storb $r15, $sr
inc $r15
jmp ResetLoadByte

#start cmd
ResetDone:
mov $sc, 4
syscall
sysret_jmp $sp

ResetError:
movu $r15, ResetErrorMsg
movl $r15, ResetErrorMsg
call PrintString
dataw 0

#print string pointed to by r15
PrintString:
pushw $sc
pushw $s1
pushw $r15

PrintString_loop:
#load datab
loadb $s1, $r15
inc $r15

#check term
test $s1
jmpif null, PrintString_done

#print datab
mov $sc, 6
syscall

#continue
jmp PrintString_loop

PrintString_done:
popw $r15
popw $s1
popw $sc
ret

#copy string from r15 to userspace at s1
CopyToUserspace:
pushw $r14
movu $r14, EndOfBios
movl $r14, EndOfBios
cmp $r14, $s1
jmpif gt, CopyToUserspace_forbidden
pushw $r15
pushw $s1

#copy data byte by byte until there is a zero byte at *$r15 or $s1 becomes 0 (that means forbidden)
CopyToUserspace_loop:
loadb $r14, $r15
inc $r15
storb $s1, $r14
inc $s1
test $s1
jmpif null, CopyToUserspace_forbidden_loop
test $r14
jmpifn null, CopyToUserspace_loop

CopyToUserspace_done:
popw $s1
popw $r15
popw $r14
mov $sr, 0
ret

CopyToUserspace_forbidden_loop:
popw $s1
popw $r15
CopyToUserspace_forbidden:
popw $r14
pushw $r15
movu $r15, AccessForbiddenMsg
movl $r15, AccessForbiddenMsg
call PrintString
popw $r15
movu $sr, 255
movl $sr, 255
ret

#strings
ResetErrorMsg:
datab 'E'
datab 'r'
datab 'r'
datab 'o'
datab 'r'
datab '!'
datab 10
datab 0

CmdPath:
datab 'c'
datab 'm'
datab 'd'
datab 0

AccessForbiddenMsg:
datab 'A'
datab 'c'
datab 'c'
datab 'e'
datab 's'
datab 's'
datab 32
datab 'F'
datab 'o'
datab 'r'
datab 'b'
datab 'i'
datab 'd'
datab 'd'
datab 'e'
datab 'n'
datab '!'
datab 10
datab 0

WelcomeMsg:
datab 'W'
datab 'e'
datab 'l'
datab 'c'
datab 'o'
datab 'm'
datab 'e'
datab '!'
datab 10
datab 0

UnameStr:
datab 'U'
datab 's'
datab 'e'
datab 'l'
datab 'e'
datab 's'
datab 's'
datab 'O'
datab 'S'
datab 32
datab '1'
datab '.'
datab '0'
datab 0

UnsaveFileName:
datab 'f'
datab 'l'
datab 'a'
datab 'g'
datab 0

StackBegin:
space 512
StackEnd:

EndOfBios:
