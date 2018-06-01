    AREA    text, CODE

    EXTERN printf

    ENTRY
    GLOBAL main
main
    ; Stack the return address (lr) in addition to a dummy register (ip) to
    ; keep the stack 8-byte aligned.
    push    {ip, lr}

    ; Load the argument and perform the call. This is like 'printf("...")' in C.
    ldr     r0, =message
    bl      printf

    ; Exit from 'main'. This is like 'return 0' in C.
    mov     r0, #0      ; Return 0.
    ; Pop the dummy ip to reverse our alignment fix, and pop the original lr
    ; value directly into pc — the Program Counter — to return.
    pop     {ip, pc}

    ; Data for the printf call. The "DCB" directive doesn't add a NULL
    ; character termination so we have to do that manually.
message
    DCB    "Hello World\n",0

    ; Silence the warning about padding the output file by explicitly filling
    ; the gap to an aligned address.
    ALIGN   4

    END
