;[org 0x7c00]

push message
jmp print_string

jmp $

print_string:
    mov bx, message
    pusha

                      ; set scrolling teletype

    print_string_start_loop:
        mov ax, bx                ; set al to the value in bx addresx
        mov ah, 0x0e 
        cmp al, 0                   ; compare the value al address to 0 to test for end of string
        je print_string_return      ; if it is 0, exit
                
        int 0x10                    ; call BIOS interrupt
        
        add bx, word 1              ; move to next bx address
        jmp print_string_start_loop ; jump to start of loop

    print_string_return:
    mov al, 0dh                      ; carriage return
    int 0x10
    mov al, 0ah                      ; new line
    int 0x10

    ;popa
    ret

message: db "the message", 0

times 510-($-$$) db 0
dw 0xaa55