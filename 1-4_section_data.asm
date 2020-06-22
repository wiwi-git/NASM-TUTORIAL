%include "io64.inc"

section .text

global CMAIN

CMAIN:

; write your code here
xor rax, rax
ret

section .data
    a db 0x33
    b dw 0x1234
    c dd 0x12345678
    d dq 0x1234