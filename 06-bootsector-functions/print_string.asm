; 
; My print function
;

print_string:
    pusha               ; push all register values to the stack
    mov ah, 0x0e        ; teletype
    int 0x10
    popa
    ret 
