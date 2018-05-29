nop
jmp $-1 ; jump to current position (enternal loop)
times 510-($-$$) db 0  ; $  = current position
                       ; $$ = begginng of the current section
dw 0xaa55