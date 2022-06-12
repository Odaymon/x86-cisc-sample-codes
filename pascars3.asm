; Author: Steven John Pascaran Section: CSC512C-G01
%include "io.inc"

section .data
varA dd 2
varB dd -3
counter db 0

section .text
global CMAIN
CMAIN:
    mov ebp, esp; for correct debugging
    ;write your code here
    mov al, 0
    mov ecx, [varA]
    mov ebx, [varB]
    
    multiply:
    imul ecx, [varA]
    imul ebx, [varB]
    ;PRINT_DEC 4, ecx
    ;NEWLINE
   
    inc BYTE[counter]
    mov al, [counter]
    ;PRINT_DEC 4, al
    ;NEWLINE
    
    cmp al,3
    je result
    jmp multiply

    result:
    PRINT_STRING "A^4: "
    PRINT_DEC 4, ecx
    NEWLINE
    
    PRINT_STRING "B^4: "
    PRINT_DEC 4, ebx
    NEWLINE
    
    add ecx, ebx
    PRINT_STRING "Total: "
    PRINT_DEC 4, ecx
    
    xor eax, eax
    ret