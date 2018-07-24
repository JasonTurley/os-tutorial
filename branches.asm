; Implement the following branches:
;   if (bx <= 4) {
;        mov al, 'A'
;   } else if (bx < 40) {
;       mov al, 'B'
;   } else {
;       mov al, 'C'
;   }

mov bx, 30

cmp bx, 4               ; if (bx <= 4)
jle target1

cmp bx, 40              ; if (bx < 40)
jl  target2

jmp target3             ; else

target1:
    mov al, 'A'
    jmp the_end

target2:
    mov al, 'B'
    jmp the_end

target3:
    mov al, 'C'

the_end:
 
mov ah, 0x0e            ; teletype mode
int 0x10                ; print the character in al

jmp $                   ; infinite loop 


; Padding and magic number
times 510-($-$$) db 0
dw 0xaa55
