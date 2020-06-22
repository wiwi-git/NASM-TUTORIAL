%include "io64.inc"

section .text
global CMAIN
CMAIN:
    ;write your code here
    ;7/2
    mov ax, 7
    mov bl, 2

    div bl

    mov bl, ah ; ah == 나머지값

    PRINT_DEC 1, al
    NEWLINE

    PRINT_DEC 1, bl
    NEWLINE

    xor rax, rax
    ret