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

dec $r15

FoundNewline:
xor $fr, $fr, $fr
storb $r15, $fr
mov $sc, 11
mov $s1, $sp
syscall

movu $r15, 1
movl $r15, 0
add $sp, $sp, $r15

test $sr
jmpifn signed, Found

NotFound:
push 0
push 'd'
push 'n'
push 'u'
push 'o'
push 'F'
push 32
push 't'
push 'o'
push 'N'
mov $s1, 10

ErrorRep:
mov $sc, 6
syscall
popb $s1
test $s1
jmpifn null, ErrorRep
ret

Found:

mov $s1, $sr
mov $sc, 3
syscall

test $sr
jmpif signed, NotFound

mov $r12, $sr
mov $r11, 0

ReadNextByte:
mov $sc, 5
mov $s1, $r12
syscall

test $sr
jmpif signed, FileRead

mov $r15, $sr

mov $r14, 4
shr $r14, $r15, $r14

mov $r13, 10
cmp $r14, $r13
jmpifn lt, TenOrMore

mov $r13, 48
add $s1, $r14, $r13
jmp PrintFirstChar

TenOrMore:
mov $r13, 87
add $s1, $r14, $r13

PrintFirstChar:
mov $sc, 6
syscall

mov $r14, 15
and $r14, $r15, $r14

mov $r13, 10
cmp $r14, $r13
jmpifn lt, TenOrMoreSecond

mov $r13, 48
add $s1, $r14, $r13
jmp PrintSecondChar

TenOrMoreSecond:
mov $r13, 87
add $s1, $r14, $r13

PrintSecondChar:
mov $sc, 6
syscall

inc $r11

mov $r10, 15
and $r11, $r11, $r10
test $r11
jmpif null, OutputNewline

mov $s1, 32
OutputSpace:
mov $sc, 6
syscall

jmp ReadNextByte

OutputNewline:
mov $s1, 10
jmp OutputSpace

FileRead:
ret
