mov cx, 0x1 
mov dx, 0x800

wait_loop:
    mov al, 0
    mov ah, 0x83
    int 0x15
    call print_key
    jmp wait_loop


print_key:
    mov ax, 0x0e41
    int 0x10
    ret

jmp $
times 510-($-$$) db 0
dw 0xaa55