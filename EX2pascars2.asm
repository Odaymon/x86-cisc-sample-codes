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
    GET_DEC 4, ecx
    GET_DEC 4, ebx
    mov [varA], ecx
    mov [varB], ebx
    
    multiply:
    imul ecx, [varA]
    imul ebx, [varB]
   
    inc BYTE[counter]
    mov al, [counter]

    cmp al,2
    je result
    jmp multiply

    result:
    PRINT_STRING "A^3: "
    PRINT_DEC 4, ecx
    NEWLINE
    
    PRINT_STRING "B^3: "
    PRINT_DEC 4, ebx
    NEWLINE
    
    add ecx, ebx
    PRINT_STRING "Sum of A^3 and B^3: "
    PRINT_DEC 4, ecx
    
    xor eax, eax
    ret