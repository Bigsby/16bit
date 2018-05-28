mov ax, 3
mov bx, 1
div bx

cmp ne, 0
je nok
mov ax, 0x0e41
jmp end

nok:
mov ax, 0x0e41

int 0x10
end:

jmp $

times 510-($-$$) db 0
dw 0xaa55