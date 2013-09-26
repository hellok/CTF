Main:
call Prompt
jmp Main

Prompt:
push 0
push 32
push '>'
push 'd'
push 'm'
push 'C'
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
push 32
push '>'
push 'd'
push 'm'
push 'C'
push 10
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
jmp PromptRep

Found:

mov $s1, $sr
mov $sc, 3
syscall

test $sr
jmpif signed, NotFound

mov $s1, $sr

movu $r15, 16
movl $r15, 0
sub $r15, $sp, $r15
mov $sp, $r15

ReadNextByte:
mov $sc, 5
syscall

test $sr
jmpif signed, FileRead

storb $r15, $sr
inc $r15

jmp ReadNextByte
FileRead:

mov $sc, 4
syscall

call $sp

movu $r15, 16
movl $r15, 0
add $sp, $sp, $r15

ret
