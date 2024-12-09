;Loop using JMP keyword
;Determine the sum of N number
;   1+2+3+4+...+N = ?

INCLUDE "EMU8086.INC"
.MODEL SMALL
.STACK 100H
.DATA
    N DB ? 
    SUM DB 0

.CODE 

MAIN PROC 
    
    MOV AX, @DATA
    MOV DS, AX
    
    ;taking input the number N
    MOV AH, 1
    INT 21H
    SUB AL, 48
    MOV N, AL    
    PRINTN
    
    MOV BL, 1  ; initialization
    
    ;for loop
    START: 
    CMP BL, N
    JG END_LOOP 
        ; statement ... ... ...
        ; ... ... ... ... ...
    ADD SUM, BL 
    
    INC BL
    JMP START
    END_LOOP:
    
    ;printing the summation
    PRINTN "THE SUMMATION IS: "  
    MOV AH, 2
    MOV DL, SUM
    INT 21H  
    
    
    MOV AH, 4CH
    INT 21H 
    MAIN ENDP
END MAIN