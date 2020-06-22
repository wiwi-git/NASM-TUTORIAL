%include "io64.inc"

section .text
global CMAIN
CMAIN:
    mov rbp, rsp; for correct debugging
    ;write your code here
    GET_DEC 2, input_a
    
    mov bx, 3
    mov edx, 1 ;

L_not_equal:
    mov eax, 0
    mov eax, edx
    mov edx, eax
    shr edx, 16
    and eax, 0x0000ffff
    
    div bx

    cmp dx, word 0
    jne L_not_multiples
    mov eax, [data_index]
    mov [data + eax * 2], dx
    inc ax
    mov [data_index], ax
L_not_multiples:
    cmp dx, [input_a]
    inc dx
    je L_not_equal

    ;print
    inc [data_index]
    PRINT_DEC 2, data_index


    xor rax, rax
    ret

section .bss
    input_a resw 1
    data resw 100
section .data
    data_index dw 0
    
