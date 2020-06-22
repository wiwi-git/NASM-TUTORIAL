%include "io64.inc"

 

section .text

global CMAIN

CMAIN:

;write your code here

PRINT_DEC 2, ax

NEWLINE

 

mov ax, 0

mov al, 2

mov bl, 4

 

PRINT_DEC 1, bx

NEWLINE

 

mul bx

 

PRINT_DEC 1, ax

NEWLINE

 

xor rax, rax

ret