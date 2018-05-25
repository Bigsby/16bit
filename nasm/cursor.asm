BITS 16
ORG 0x7c00


;1
mov cx, 0
call set_cursor

add cx, 1
call set_cursor

; mov cx, 0x2607
; call set_cursor

mov ch, 0x0
mov cl, 0x7
call set_cursor

mov dx, 0
move_cursor:
mov ah, 0x02
int 0x10
add dx, 1
call wait_func
jmp move_cursor

jmp $

set_cursor:
mov ah, 0x01
int 0x10
call wait_func
ret

wait_func:
    pusha
    mov cx, 0x1 
    mov dx, 0x800
    add al, 0x6
    mov ah, 0x86
    int 0x15
    popa
    ret

print_key:
    mov ax, 0x0e41
    int 0x10
    ret

times 510-($-$$) db 0
dw 0xaa55