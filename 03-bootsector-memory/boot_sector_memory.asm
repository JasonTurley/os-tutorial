;
; A simple boot sector program that demonstrates addressing
;
[org 0x7c00]

mov ah, 0x0e            ; int 10/ah = 0eh -> teletype BIOS mode

; First attempt
mov al, the_secret
int 0x10                ; Does this print X?

; Second attempt
mov al, [the_secret]
int 0x10                ; Does this print X?

; Third attempt
mov bx, the_secret
add bx, 0x7c00
mov al, [bx]
int 0x10                ; Does this print X?

; Fourth attempt
mov al, [0x7c1e]
int 0x10                ; Does this print X?

jmp $                   ; Jump forever.

the_secret:
    db "X"

; Padding and magic BIOS number
times 510-($-$$) db 0
dw 0xaa55
