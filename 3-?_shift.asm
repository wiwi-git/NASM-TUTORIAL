%include "io64.inc"


section .text
global CMAIN
CMAIN:
    ;write your code here
    
    mov ax, 0x1234

    PRINT_HEX 2, ax
    NEWLINE

    shl ax,4

    PRINT_HEX 2, ax
    NEWLINE

    mov [a], word 0x1234
    PRINT_HEX 2, a
    NEWLINE

    shr word [a], 4 ; 메모리 변수의 크기를 말해주지않으면 에러...   
    PRINT_HEX 2,a
    NEWLINE

    xor rax, rax
    ret

section .bss
    a resw 1