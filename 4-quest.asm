%include "io64.inc"

section .text
global CMAIN
CMAIN:
    mov rbp, rsp; for correct debugging
    GET_DEC 2, input

L_loop:
    add [for_index],word 1 ; 반복 인덱스값 증가 
    
    ;인덱스값이 3의 배수인지 판별하려고 3으로나눠봄 
    mov eax, [for_index]
    ;dx에 전반부 ax에 후반부로 나눠야 계산이됨 - 실제 저장된건 리틀엔디안 스타일이기에 값으로는 반대
    mov edx, eax
    shr edx, 16

    and eax, 0x0000ffff
    
    mov bx, 3
    div bx ; 값은 ax에 몫, dx에 나머지가 저장됨 

    cmp dx, 0 ; 나머지가 0인지 판별하려고함 
    jne L_after_save ;0이 아니라면 데이터배열에 저장하지않음
    
    ;데이터배열에 저장
    mov eax, 0
    mov ax, [data_index]
    mov bx, [for_index]
    mov [data + eax * 2], bx
    inc ax
    mov [data_index], ax

L_after_save:
    mov bx, [for_index]
    cmp bx, [input]
    jne L_loop; for_index가 입력된 값과 같을때까지 반복

    ; 저장된 값 출력
    PRINT_STRING str_print_start
    mov eax, 0
L_print_loop:
    ;3의 배수값 출력 + 합구하기 
    mov dx, [data + eax * 2]
    add [total], dx
    PRINT_DEC 2, dx
    PRINT_STRING str_comma_space
    
    inc ax
    
    mov bx, [data_index]
    cmp ax, bx
    jne L_print_loop
    
    NEWLINE
    ;저장된 개수
    PRINT_STRING str_count
    PRINT_DEC 2, [data_index]
    NEWLINE
    ;합
    PRINT_STRING str_total
    PRINT_DEC 2, [total]
    NEWLINE
    
    xor rax, rax
    ret

section .bss
    data resw 100
    input resw 1
section .data
    data_index dw 0
    for_index dw 0
    total dw 0
    ;msg
    str_print_start db '3의 배수 : ',0x00
    str_comma_space db ', ',0x00
    str_count db '3의 배수 갯수 : ',0x00
    str_total db '총합 : ',0x00