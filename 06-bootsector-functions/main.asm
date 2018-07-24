;
; Driver function
;

[org 0x7c00]                    ; tell the assembler that our offset is bootsector code

; Set up parameters and make function calls
mov bx, HELLO
call print

call print_nl

mov bx, GOODBYE
call print

call print_nl

;mov dx, 0x12fe
;call print_hex

; That's all! now hang
jmp $

; Remember to include function calls below the hang
%include "print_string.asm"


; Data
HELLO:
    db 'Hello, World', 0

GOODBYE:
    db 'Goodbye', 0

; Padding and magic number
times 510-($-$$) db 0
dw 0xaa55
