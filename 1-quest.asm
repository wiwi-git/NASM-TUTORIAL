%include "io64.inc"


section .text
global CMAIN
CMAIN:
    ;write your code here
    ;al = 1byte, ax = 2byte = 1word, eax = 2word = dword, rax = 4word = qword
    mov al, [origin_a]
    mov [copy_a], al
    mov ax, [origin_b]
    mov [copy_b], ax
    mov eax, [origin_c]
    mov [copy_c], eax
    mov rax, [origin_d]
    mov [copy_d], rax
    
    PRINT_HEX 1, copy_a
    NEWLINE
    
    PRINT_HEX 2, copy_b
    NEWLINE

    PRINT_HEX 4, copy_c
    NEWLINE

    PRINT_HEX 8, copy_d
    NEWLINE

    PRINT_HEX 1, origin_a
    NEWLINE

    PRINT_HEX 2, origin_b
    NEWLINE

    PRINT_HEX 4, origin_c
    NEWLINE

    PRINT_HEX 8, origin_d
    NEWLINE

    xor rax, rax
    ret

section .data
    origin_a db 0x01 ;1byte
    origin_b dw 0x0101 ;2byte
    origin_c dd 0x01010101 ;4byte
    origin_d dq 0x0101010101010101 ; 8byte

section .bss
    copy_a resb 1
    copy_b resw 1
    copy_c resd 1
    copy_d resq 1
