; A simple boot sector program that demonstrates the stack

mov ah, 0x0e                ; tele-type mode

mov bp, 0x8000              ; Set the base pointer a little above where BIOS
mov sp, bp                  ; loads our boot sector - so it won't overwrite us

push 'A'                    ; Push characters on the stack for later
push 'B'                    ; Note, these are pushed on as 16-bit values,
push 'C'                    ; so the most significant byte will be added by
                            ; our assembler as 0x00

; pop bx                      ; Note, we can only pop 16-bits at a time, so pop
; mov al, bl                  ; to bx then copy bl (i.e.8-bit char) to al
;int 0x10                    ; print (al)

mov al, [0x7ffe]
int 0x10

;pop bx                      ; Pop the next value
;mov al, bl
;int 0x10                    ; print (al)

mov al, [0x7fce]            ; To prove our stack grows downwards from bp, 
                            ; fetch the char at 0x8000 - 0x2 (i.e. 16-bits)
int 0x10                    ; print (al)

jmp $                       ; Infinite loop

; Padding and magic BIOS number
times 510-($-$$) db 0
dw 0xaa55
