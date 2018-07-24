;
; Helper functions to print strings to BIOS tty screen
;

print:    
    pusha                   ; 'push all' register variables to the stack prior to 
                        ; function call

; keep this in mind
; while (my_string[i] != 0) { print( my_string[i]; i++ ) }

start:
    mov al, [bx]        ; 'bx' is the base address for the string
    cmp al, 0           ; are we at the end of the string?
    je done
    
    mov ah, 0x0e        ; print to the BIOS tty
    int 0x10            ; 'al' already contains the character   

    add bx, 1           ; increment pointer and loop again
    jmp start

done:
    popa                ; 'pop all' register variables from the stack
    ret


; print a newline character '\n'
print_nl:
    pusha
    mov ah, 0x0e   

    mov al, 0x0a        ; newline character
    int 0x10

    mov al, 0x0d        ; carriage return
    int 0x10

    popa
    ret
