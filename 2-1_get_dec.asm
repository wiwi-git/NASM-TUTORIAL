%include "io64.inc"


section .text
global CMAIN
CMAIN:
    ;write your code here
    GET_DEC 1, al
    GET_DEC 2,a

    PRINT_DEC 1,al
    NEWLINE

    PRINT_DEC 2, a

    xor rax, rax
    ret

section .bss
    a resw 1