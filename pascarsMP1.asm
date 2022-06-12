; Author: Steven John Pascaran Section: CSC512C-G01
%include "io.inc"

section .data
inp dd 0
sum dd 0
digit dd 0
counter dd 0

section .text
global CMAIN
CMAIN:
    mov ebp, esp; for correct debugging
    ;write your code here
    continue:
    mov eax, 0
    mov ebx, 0
    mov ecx, 0
    mov edx, 0
    mov [inp], eax
    mov [sum], eax
    mov [digit], eax
    mov [counter], eax
    GET_DEC 4, eax
    mov [inp], eax
    
    ;PRINT_DEC 4, inp
    ;jmp end
    
    cmp eax,0
    JE invalid
    
    cmp eax,0
    JLE invalidneg
    
    PRINT_STRING "Input Number: "
    PRINT_DEC 4, inp
    NEWLINE
    
    PRINT_STRING "Digits: "
    getdigit:
    MOV bl, 10
    DIV bl

    add [sum], ah
    push ax
    inc byte[counter]
   
    MOV [digit], al
    MOV eax, [digit]
    cmp al,0
    JNE getdigit
    
    popdigit:
    pop ax
    PRINT_DEC 4, ah
    dec byte[counter]
    mov dl, [counter]
    cmp dl, 0
    JE skip
    PRINT_STRING ","
    cmp dl,0
    JNE popdigit
    
    skip:
    NEWLINE
    PRINT_STRING "Sum of digits: "
    PRINT_DEC 4, sum
    NEWLINE
    
    MOV eax, [inp]
    MOV bl, [sum]
    DIV bl
    PRINT_STRING "Quotient: "
    PRINT_DEC 4, al
    NEWLINE
    PRINT_STRING "Remainder: "
    PRINT_DEC 4, ah
    NEWLINE
    
    PRINT_STRING "Harshad Number: "
    cmp ah,0
    JE isHarshad
    PRINT_STRING "No"
    NEWLINE
    jmp again
    
    isHarshad:
    PRINT_STRING "Yes"
    NEWLINE
    
    again:
    PRINT_STRING "Do you want to continue(Y/N)? "
    GET_CHAR bl
    PRINT_CHAR bl
    cmp bl,"Y"
    NEWLINE
    JE continue
    cmp bl,"y"
    JE continue
    jmp end
    
    invalidneg:
    PRINT_STRING "Error: negative number input"
    NEWLINE
    jmp continue
    
    invalid:
    PRINT_STRING "Error: invalid input"
    NEWLINE
    jmp continue
    
    end:
    xor eax, eax
    ret