; an attempt to "use int 21h" in a bootsector
; nasm -f bin -o boothw2u.bin boothw2u.asm
; dd if=boothw2u.bin of=/dev/fd0

bits 16

org 7C00h

    jmp short start
    nop
msg db 13, 10, "Please tell me your name? ", 0
msg2 db 13, 10, "Hello, ", 0
nimsg db 13, 10, "Sorry, not implemented!", 13, 10, 0

inbuf db 20h, 0
    times 20h db 0
    
start:
    xor ax, ax
    mov ds, ax
    mov es, ax
    mov fs, ax
    mov gs, ax
    cli
    mov ss, ax
    mov sp, ax
    sti
    
    cli
    mov word [21h * 4], my21
    mov [21h * 4 + 2], ds
    sti
    
    mov dx, msg
    mov ah, 9
    int 21h
    
    mov dx, inbuf
    mov ah, 0Ah
    int 21h
    
    mov dx, msg2
    mov ah, 9
    int 21h
    
    mov dx, inbuf + 2
    mov ah, 9
    int 21h
    
blackhole:
    jmp blackhole
;------------------------------    

my21:
    pusha
        
    cmp ah, 9
    jne .not9
    call my21_9
    jmp .done
.not9:
    cmp ah, 0Ah
    jne .notA
    call my21_A
    jmp .done
.notA:
    
    mov dx, nimsg
    call my21_9

.done:
    popa
    iret

my21_9:
    xchg si, dx
    mov ah, 0Eh
    mov bx, 7
.top:
    lodsb
    test al, al
    jz .done
    int 10h
    jmp .top
.done:
    ret

my21_A:
    mov di, dx
    xor cx, cx
    mov bx, 7
    mov cl, [di]
    add di, 2
.top:
    dec cl
    jz .done
    mov ah, 0
    int 16h
    mov ah, 0Eh
    int 10h
    cmp al, 13
    jz .done
    stosb
    inc ch
    jmp .top
.done:
    mov al, 0
    stosb
    mov di, dx
    mov [di + 1], ch
    ret

times 510 - ($ - $$) db 0
db 55h, 0AAh