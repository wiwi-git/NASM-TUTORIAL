%include "io64.inc"

 
section .text
global CMAIN

CMAIN:
    ;write your code here
    ;mov edx, 0
    ;mov eax, 0

    mov ax, 0x2710;10000(10)
    mov bx, 0x1388;5000(10)

    mul bx ; dx:ax = ax*bx
    shl edx, 16; dx에 이미 상위값이 들어가있다. 들어가기전에 왜 edx를0 으로 초기화를 안해주는걸까.?
    and eax, 0x0000ffff;edx와 마찬가지로 ax에 하위값이 들어가있다.
    or eax,edx
    mov [result], eax

    PRINT_HEX 4,result
    NEWLINE
    PRINT_DEC 4,result
    NEWLINE

    xor rax, rax
    ret

section .bss
    result resd 1