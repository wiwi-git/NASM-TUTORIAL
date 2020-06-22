%include "io64.inc"

section .text
global CMAIN
CMAIN:
    ;write your code here
    mov ax, 1
    mov bx, 3
    
    add ax, bx ;레지스터 + 레지스터
    PRINT_DEC 2, ax
    NEWLINE

    mov [a], word 7
    add ax, [a] ; 레지스터 + 메모리
    PRINT_DEC 2, ax
    NEWLINE

    mov bx, 2
    add [a], bx ; 메모리 + 레지스터
    PRINT_DEC 2, a
    NEWLINE

    mov [b], byte 2 ; word(2byte)에 1바이트인 2값을 넣음
    add [b], ax
    ;add [a], [b] ; ERROR 메모리 + 메모리는 오류남 
    PRINT_DEC 2, b
    NEWLINE

    xor rax, rax
    ret
section .bss
    a resw 1
    b resw 1