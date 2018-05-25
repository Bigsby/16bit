push 0x0e41
mov ax, 0x0e42
call func
int 0x10

jmp $

func:
    pop bx
    pusha
    mov ax, bx
    int 0x10
    popa
    ret


times 510-($-$$) db 0
dw 0xaa55