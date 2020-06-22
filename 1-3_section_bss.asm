%include "io64.inc"

section .text
global CMAIN
CMAIN: 
    ;write your code here

    xor rax, rax
    ret

section .bss
    a resb 1
    b resw 2
    c resd 1
    d resq 3