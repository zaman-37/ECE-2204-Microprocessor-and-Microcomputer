; Taking binary input.................................

INCLUDE "EMU8086.INC"
.MODEL SMALL
.STACK 100H
.DATA


.CODE 
MAIN PROC
    
    MOV BX, 0
    ; taking the binary input using loop 
    PRINT "INPUT: "
    FOR: 
        MOV AH, 1
        INT 21H
        CMP AL, 0DH
        JE FOR_END
        
        SUB AL, 48
        SHL BX, 1
        OR BL, AL  
        
        JMP FOR
    FOR_END:
    
    ; output of the binary number
    PRINTN
    ADD BX, 48
    MOV AH, 2
    MOV DL, BL
    INT 21H
    
    
    MOV AH, 4CH
    INT 21H
    MAIN ENDP
END MAIN