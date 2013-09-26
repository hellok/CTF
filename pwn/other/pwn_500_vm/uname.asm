movu $r15, 1
movl $r15, 0
mov $r14, $sp
sub $sp, $sp, $r15
mov $sc, 15
mov $s1, $sp
syscall

Next:
popb $s1
test $s1
jmpif null, EOF
mov $sc, 6
syscall
jmp Next

EOF:
mov $sc, 6
mov $s1, 10
syscall
mov $sp, $r14
ret
