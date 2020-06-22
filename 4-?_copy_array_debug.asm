%include "io64.inc"

section .text
global CMAIN
CMAIN:
    ;write your code here
    mov eax, my1
    mov ebx, you1

    mov edx, 0
    mov ecx, 3

L1:
    mov eax, [my1 + edx * 2]
    mov [you1 + edx * 2], eax
    inc edx
    loop L1

    mov edx, 0

L2:
    PRINT_HEX 2, my1 + edx * 2
    xor rax, rax
    ret