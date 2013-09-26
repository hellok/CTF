Prompt:
push 0
push 32
push '?'
push 'e'
push 'l'
push 'i'
push 'F'
mov $s1, 10

PromptRep:
mov $sc, 6
syscall
popb $s1
test $s1
jmpifn null, PromptRep

movu $r15, 1
movl $r15, 0
sub $r15, $sp, $r15
mov $sp, $r15

ReadChar:
mov $sc, 2
syscall

mov $s1, 10
cmp $s1, $sc
jmpif eq, FoundNewline

storb $r15, $sc
inc $r15
sub $fr, $r15, $sp
jmpifn f8, ReadChar

movu $r15, 1
movl $r15, 0
add $sp, $sp, $r15

push 0
push 'g'
push 'n'
push 'o'
push 'L'
push 32
push 'o'
push 'o'
push 'T'
mov $s1, 10

ErrorRep:
mov $sc, 6
syscall
popb $s1
test $s1
jmpifn null, ErrorRep
ret

dec $r15

FoundNewline:
xor $fr, $fr, $fr
storb $r15, $fr
mov $sc, 11
mov $s1, $sp
syscall
mov $s1, $sr

test $s1
jmpifn signed, Found

mov $sc, 1
syscall

mov $s2, $sp
mov $s1, $sr
mov $sc, 10
syscall

Found:
movu $r15, 1
movl $r15, 0
add $sp, $sp, $r15

mov $sc, 3
syscall

test $sr
jmpifn signed, Fine

push 0
push 'r'
push 'o'
push 'r'
push 'r'
push 'E'
push 32
push 'n'
push 'w'
push 'o'
push 'n'
push 'k'
push 'n'
push 'U'
mov $s1, 10

jmp ErrorRep

Fine:
mov $r12, $sr
mov $r11, 0

Rep:
call ReadHexChar
test $sr
jmpif signed, Exit
mov $r14, 4
shl $r14, $sr, $r14

call ReadHexChar
test $sr
jmpif signed, Exit
or $s2, $sr, $r14

mov $sc, 7
mov $s1, $r12
syscall
test $sr
jmpif signed, Exit

jmp Rep

Exit:
mov $sc, 4
mov $s1, $r12
syscall
ret

ReadHexChar:
mov $sc, 2
syscall

mov $r15, 10
cmp $sr, $r15
jmpif eq, ReadHexChar

mov $r15, 13
cmp $sr, $r15
jmpif eq, ReadHexChar

mov $r15, 32
cmp $sr, $r15
jmpif eq, ReadHexChar

mov $r15, '0'
cmp $sr, $r15
jmpif lt, BadChar

mov $r15, '9'
cmp $r15, $sr
jmpif lt, FirstIsNotNumber

mov $r15, '0'
sub $sr, $sr, $r15
ret

FirstIsNotNumber:
mov $r15, 'A'
cmp $sr, $r15
jmpif lt, BadChar

mov $r15, 'F'
cmp $r15, $sr
jmpif lt, FirstIsNotUpperChar

mov $r15, 55
sub $sr, $sr, $r15
ret

FirstIsNotUpperChar:
mov $r15, 'a'
cmp $sr, $r15
jmpif lt, BadChar

mov $r15, 'f'
cmp $r15, $sr
jmpif lt, BadChar

mov $r15, 87
sub $sr, $sr, $r15
ret

BadChar:
movu $sr, 255
ret
