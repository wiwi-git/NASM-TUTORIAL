include "io64.inc"

 
section .text
global CMAIN
CMAIN:
    ;write your code here
    mov al, [target_a];0xb6
    mov bl, 0b01010101; 0x55

    ;and
    and al,bl
    PRINT_HEX 1,al
    NEWLINE

    ;or
    mov al,[target_a]
    or al,bl
    PRINT_HEX 1,al
    NEWLINE

    ;xor
    mov al, [target_a]
    xor al,bl
    PRINT_HEX 1, al
    NEWLINE

    ;not
    mov al, [target_a]
    not al
    PRINT_HEX 1, al
    NEWLINE

    xor rax, rax
    ret

section .data
    target_a db 0b10110110; 0xb6 0b는 이진수