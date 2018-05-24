mov ax, 0xffff
mov dx, ax
mov al, 0x40

wait_loop:
    add al, 0x1
    mov ah, 0x86
    int 0x15
    call print_key
    jmp wait_loop


print_key:
    mov ah, 0x0e
    int 0x10
    ret

jmp $
times 510-($-$$) db 0
dw 0xaa55