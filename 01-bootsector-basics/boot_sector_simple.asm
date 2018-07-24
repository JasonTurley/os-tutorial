; The boot sector is responsible for loading the operating system.
; It is located in the first sector of the disk (cylindar 0, head 0, sector 0)
; and is 512 bytes

; Infinite loop (e9 fd ff)
loop:
    jmp loop

; When compiled, out program must fit into 512 bytes, with the last two being
; the magic number. So we pad with 510 zeros (db 0)
times 510-($-$$) db 0

; Magic number - ensure the disk is bootable
dw 0xaa55
