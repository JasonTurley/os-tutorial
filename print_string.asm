; Simple program to demo how string work

; use a label for easier access
my_string:
    db 'Hello, there', 0        ; null-terminated

mov ah, 0x0e                    ; tele-type mode

; print string
mov bx, my_string
add bx, 0x7c00
mov al, [bx] 
int 0x10

jmp $                           ; infinite loop

; padding
times 510-($-$$) db 0
dw 0xaa55
