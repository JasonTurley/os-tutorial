; 
; A boot sector that prints a string using our function
;
[org 0x7c00]                ; Tell the assembler where this code will be loaded

mov ax, HELLO_MSG           ; Use BX as a function parameter 
call print_string

mov ax, GOODBYE_MSG
call print_string

jmp $                       ; Hang time

%include "print_string.asm"

; Data
HELLO_MSG:
    db 'Hello, World', 0   ; <-- zero is the null terminator

GOODBYE_MSG:
    db 'Goodbye', 0

; Padding and magic number
times 510-($-$$) db 0
dw 0xaa55
