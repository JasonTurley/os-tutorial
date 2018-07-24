; Print 'Hello' in boot sector via ISRs (interrupt service routines)
; eax is a 32-bit register. The lower half of eax is ax, a 16-bit register. ax is
; divided into two 8-bit registers, ah and al (a-high and a-low).

mov ah, 0x0e    ; teletype mode

mov al, 'H'
int 0x10        ; invoke the screen related ISR
mov al, 'e'
int 0x10
mov al, 'l'
int 0x10
int 0x10        ; 'l' is still on al, remember?
mov al, 'o'
int 0x10

jmp $           ; jump to current address (infinite loop)

; padding and magic BIOS number
times 510 - ($-$$) db 0
dw 0xaa55
