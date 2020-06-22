%include "io64.inc"


section .text
global CMAIN
CMAIN:
    mov rbp, rsp; for correct debugging
    ;write your code here

    mov ax, 0
    mov bx, 0

    ;input
    GET_DEC 1, al
    GET_DEC 1, bl

    mov [input_a], al
    mov [input_b], bl

    PRINT_DEC 1, input_a
    PRINT_STRING str_space
    PRINT_DEC 1, input_b
    NEWLINE

    ;add
    add al,bl
    mov [result_add], al

    ;sub
    mov al, [input_a]
    sub al,bl
    mov [result_sub], al

    ;mul
    mov ax, 0
    mov al, [input_a]
    mul bx
    mov [result_mul], ax

    ;div
    mov ax,0
    mov bx,0
    mov al, [input_a];ax에 넣어서 계산하면 오류는 안뜨나 뒤에 가 작동안함... 왜그런지 모르겠다.
    mov bl, [input_b]

    div bl
    mov [result_div_quotient], al

    mov bl, ah
    mov [result_div_remainder], bl

    ;print
    PRINT_STRING str_add
    PRINT_DEC 1, result_add
    NEWLINE

    PRINT_STRING str_sub
    PRINT_DEC 1, result_sub
    NEWLINE

    PRINT_STRING str_mul
    PRINT_DEC 2, result_mul
    NEWLINE

    PRINT_STRING str_div_quotient
    PRINT_DEC 1, result_div_quotient
    NEWLINE

    PRINT_STRING str_div_remainder
    PRINT_DEC 1, result_div_remainder
    NEWLINE

    xor rax, rax
    ret

section .bss
    input_a resb 1
    input_b resb 1

    result_add resb 1
    result_sub resb 1
    result_mul resw 1
    result_div_quotient resb 1
    result_div_remainder resb 1

section .data
    str_space db ' ',0x00
    str_add db 'add : ',0x00
    str_sub db 'sub : ',0x00
    str_mul db 'mul : ',0x00
    str_div_quotient db 'div-quotient : ',0x00
    str_div_remainder db 'div-remainder : ',0x00