mov $r15, $sp
movl $sp, 0
movu $sp, 1
sub $sp, $r15, $sp

mov $sc, 12
syscall
mov $r14, $sr

FileLoop:
test $r14
jmpif null, End
dec $r14

mov $sc, 9
mov $s1, $r14
mov $s2, $sp
syscall

mov $r13, $sp
CharLoop:

mov $sc, 6
loadb $s1, $r13
test $s1
jmpif null, NewLine

syscall

inc $r13
jmp CharLoop

NewLine:
mov $s1, 10
syscall

jmp FileLoop

End:
mov $sp, $r15
ret
