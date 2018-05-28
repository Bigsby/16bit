push 0x0e41
pop ax
int 0x10

jmp $
times 510-($-$$) db 0
dw 0xaa55