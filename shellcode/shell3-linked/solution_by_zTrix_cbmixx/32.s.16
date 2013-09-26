    popa
loop:
    mov (%esi), %esi
    cmpw $0x4100, 4(%esi)
    jne loop
    lea 8(%esi), %eax
    jmp %edi
