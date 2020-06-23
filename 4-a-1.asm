%include "io64.inc"
 
section .text
global CMAIN
CMAIN:
    mov rbp, rsp; for correct debugging
    GET_DEC 2, ax
    mov [target], ax
L_loop:
    mov eax, 0
    mov edx, 0

    mov eax, dword [target]
    and eax, 0x0000ffff
    
    mov edx, eax
    shr edx, 16
    and eax, 0x0000ffff
 
    mov ebx, 0
    mov bx, 2
    div bx
    
    mov ebx, [remainder_index]
    mov [remainder + ebx * 2], dx
    add [remainder_index], word 1
 
    mov [target], ax
    cmp ax, 1
    jle L_loop_end
    jmp L_loop
L_loop_end:
    ;print
    PRINT_DEC 2, target
    ;NEWLINE
    
    mov eax, 0
    mov eax, [remainder_index]
    dec eax
    
L_print_loop:
    PRINT_DEC 2, [remainder + eax * 2]
    ;NEWLINE
    add [print_count], word 1
    
    dec ax
    mov bx, [print_count]
    cmp bx, [remainder_index]
    je L_end
    jmp L_print_loop
L_end: 
    xor rax,rax
    ret
section .bss
    target resw 1
    remainder resw 100
section .data
    remainder_index dw 0
    print_count dw 0