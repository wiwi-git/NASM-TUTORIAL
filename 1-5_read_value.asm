%include "io64.inc"

section .text
global CMAIN
CMAIN:
    ;write your code here
    mov al, [a]
    mov eax, a
    ;mov [a], 0x34 ; 에러 넣으려는 값의 크기를 명시화해야함
    mov [a], byte 0x34
    
    xor rax, rax
    ret

section .data
    a db 0x12