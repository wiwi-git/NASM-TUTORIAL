%include "io64.inc"

section .text
global CMAIN
CMAIN:
    mov rbp, rsp; for correct debugging
    ;write your code here
    mov ax, 0x1234
    and ax, 0x0000; zf설정됨 ax값도 변경됨
    PRINT_HEX 2, ax
    NEWLINE

    add ax, 0x1234; zf가 설정된게 풀어짐
    mov ax, 0x1234
    test ax,0x0000; zf값은 설정되나 ax값은 변경안됨
    PRINT_HEX 2, ax
    NEWLINE

    xor rax, rax
    ret