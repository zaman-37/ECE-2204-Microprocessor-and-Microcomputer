; HEX input and output

INCLUDE "EMU8086.INC"
.MODEL SMALL
.STACK 100H
.DATA

.CODE

MAIN PROC 
    
    MOV BX, 0
    MOV CL, 4
    
    PRINT "INPUT: "
    FOR1:
        MOV AH, 1
        INT 21H
        CMP AL, 0DH
        JE END_FOR1
        
        ; number
        CMP AL, 41H
        JGE CHARACTER
        SUB AL, 48 
        SHL BX, CL
        OR BL, AL 
        JMP AT_LAST
        
        ; letter
        CHARACTER: 
        SUB AL, 55  
        SHL BX, CL
        OR BL, AL
        AT_LAST:
        JMP FOR1 
    END_FOR1:
    
    PRINTN
    PRINT "OUTPUT: "
    
    MOV AH, 2   
    ;ADD BL, 55
    MOV DL, BL
    INT 21H
    
    
    MOV AH, 4CH
    INT 21H
    MAIN ENDP
END MAIN