%include "io64.inc"

section .text
global CMAIN
CMAIN:
    ;주석, 한글한글, 주석은 세미콜론 세미콜론 세미콜론 왜 자동으로 들여쓰기가 안될까 불편한 ide
    mov eax, 10 ;eax 레지스터에 10넣기
    PRINT_DEC 1, eax ;프린트 매크로함수(nasm 전용이래) 

    xor rax, rax
    ret