%include "io64.inc"

section .text
global CMAIN
CMAIN:
    ;write your code here
    mov eax, 0x12345678 ;305419896
    mov bx, 0x4567 ;17767
 
    mov edx, eax
    shr edx, 16
    and eax, 0x0000ffff
    div bx
    mov [quotient], ax
    mov [remainder], dx

    PRINT_HEX 2, quotient
    NEWLINE
    PRINT_DEC 2, quotient
    NEWLINE
    PRINT_HEX 2, remainder
    NEWLINE
    PRINT_DEC 2, remainder
    NEWLINE

    xor rax, rax
    ret

section .bss
    quotient resw 1
    remainder resw 1