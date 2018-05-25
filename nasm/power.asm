BITS 16
ORG 0x7c00

mov cx, 0x10 
mov dx, 0x800
mov ah, 0x86
int 0x15

mov ah,53h            ;this is an APM command
mov al,00h            ;installation check command
xor bx,bx             ;device id (0 = APM BIOS)
int 15h               ;call the BIOS function through interrupt 15h
jc APM_error          ;if the carry flag is set there was an error
                      ;the function was successful
                      ;AX = APM version number
                          ;AH = Major revision number (in BCD format)
                          ;AL = Minor revision number (also BCD format)
                      ;BX = ASCII characters "P" (in BH) and "M" (in BL)
                      ;CX = APM flags (see the official documentation for more details)


;disconnect from any APM interface
mov ah,53h               ;this is an APM command
mov al,04h               ;interface disconnect command
xor bx,bx                ;device id (0 = APM BIOS)
int 15h                  ;call the BIOS function through interrupt 15h
jc disconnect_error            ;if the carry flag is set see what the fuss is about. 
jmp no_error

disconnect_error:       ;the error code is in ah.
cmp ah,03h               ;if the error code is anything but 03h there was an error.
jne APM_error            ;the error code 03h means that no interface was connected in the first place.

no_error:
                         ;the function was successful
                         ;Nothing is returned.





;Enable power management for all devices
mov ah,53h              ;this is an APM command
mov al,08h              ;Change the state of power management...
mov bx,0001h            ;...on all devices to...
mov cx,0001h            ;...power management on.
int 15h                 ;call the BIOS function through interrupt 15h
jc APM_error      

;Set the power state for all devices
mov ah,53h              ;this is an APM command
mov al,07h              ;Set the power state...
mov bx,0001h            ;...on all devices to...
mov cx,03h            ;see above
int 15h                 ;call the BIOS function through interrupt 15h
jc APM_error      

APM_error:
jmp $

times 510-($-$$) db 0
dw 0xaa55