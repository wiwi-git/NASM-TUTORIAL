%include "io64.inc"


section .text
global CMAIN
CMAIN:
    mov eax, 0x1234 ; A레지스터 32비트 크기에 0x1234 저장
    mov ax, 0x1234 ; A레지스터 16비트 크기에 0x1234 저장
    mov ax, bx ; bx의 값을 ax에 복사
    mov ax, ebx ; 에러발생 ebx(32bit) 값을 ax(16bit)에 복사 (데이터손실로 허용하지 않음)
    
    xor rax, rax
    ret