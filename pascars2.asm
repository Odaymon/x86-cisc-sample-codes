; Author: Steven John Pascaran Section: CSC512C-G01
%include "io.inc"

section .data
STRVAR db "ACGTACGTCCCGGG",0
KOUNTC db 0
KOUNTG db 0
DNALEN db 0

section .text
global CMAIN
CMAIN:
    ;write your code here
    lea esi,[STRVAR]
    
    again:
    mov al,[esi] ; get 1 byte at a time
    cmp al,0     ; check if it's 0 to terminate
    JE end
    cmp AL,"C"
    JNE L1
    inc byte[KOUNTC] 
    L1:
    cmp AL,"G"
    JNE L2
    inc byte[KOUNTG]
    L2:
    ADD esi, 1
    inc byte[DNALEN]
    jmp again
    
    
    end:
    PRINT_STRING "C Count: "
    PRINT_DEC 1,[KOUNTC]
    NEWLINE
    PRINT_STRING "G Count: "
    PRINT_DEC 1,[KOUNTG]
    NEWLINE
    PRINT_STRING "DNA Length: "
    PRINT_DEC 1,[DNALEN]
    
    xor eax, eax
    ret