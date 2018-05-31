BITS 16
ORG 0x7c00

call clearScreen
jmp $

clearScreen:
; Clear screen and reset cursor position
; In: none
; Out: none
; Global:
;	color		The color to use
;	es		The screen segment
;	cursor_pos	Cursor position (modified)
mov ah, [cs:color]
mov al, 0
mov cx, SCREEN_COLS * SCREEN_ROWS
xor di, di
rep stosw
mov [cs:cursor_pos], word 0
ret

SCREEN_COLS EQU 80
SCREEN_ROWS EQU 25
color db 7	; White on black
cursor_pos dw 0

times 510-($-$$) db 0
dw 0xaa55