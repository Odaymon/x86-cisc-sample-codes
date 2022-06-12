; Author: Steven John Pascaran Section: CSC512C-G01
%include "io.inc"

section .text
global CMAIN
CMAIN:
    ;write your code here
    GET_DEC 4, eax
    GET_CHAR ebx

    cmp ebx, 0
    JNE invalid
    
    cmp eax,0
    JLE invalid
    JMP valid
    
    invalid:
    PRINT_STRING "Output: invalid"
    NEWLINE
    JMP end
    
    valid:
    PRINT_STRING "Output: valid"
    NEWLINE
    
    end:
    
    xor eax, eax
    ret