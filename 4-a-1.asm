%include "io64.inc"

section .text
global CMAIN
CMAIN:
    mov rbp, rsp; for correct debugging
    GET_DEC 2, ax
    mov [target], ax
L_loop:
    mov eax, 0
    mov eax, [target]
    mov edx, eax
    shr edx, 16
    and eax, 0x0000ffff

    mov ebx, 0
    mov bx, 2
    div bx
    
    mov ebx, 0
    mov bx, [remainder_index]
    mov [remainder + ebx * 2], dx
    add [remainder_index], word 1

    mov [target], ax
    cmp ax, 1
    jne L_loop

    ;print 
    mov eax, 0
    mov bx, [remainder_index]
    
    PRINT_DEC 2, ax
    NEWLINE
L_print_loop:
    PRINT_DEC 2, [remainder + eax * 2]
    NEWLINE
    inc ax

    cmp ax, bx
    jne L_print_loop

L_end:
    xor rax,rax
    ret
section .bss
    target resw 1
    remainder resw 100
    quotient resw 1
section .data
    remainder_index dw 0