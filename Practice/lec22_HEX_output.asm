; HEX input and output

INCLUDE "EMU8086.INC"
.MODEL SMALL
.STACK 100H
.DATA

.CODE

MAIN PROC 
    
    MOV BX, 0
    MOV CL, 4
    
    ; taking hex input........................................................................................
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
    
    ; hex output.............................................................................................
    PRINTN  
    PRINT "OUTPUT: " 
    
    XOR CX, CX
    MOV CL, 4
    FOR2:     
        ;CMP CL, 0
        ;JE FOR2_EXIT
        
        MOV DL, BH
        SHR DL, 4 
        SHL BX, 4
        
        CMP DL, 10
        JGE LETTER
        
        ; digit
        ADD DL, 48
        JMP PRINT1
        ; letter
        LETTER:
        ADD DL, 55
        
        PRINT1: 
        MOV AH, 2
        INT 21H
        
        ;DEC CL
        ;JMP FOR2
    ;FOR2_EXIT:
    LOOP FOR2               
    
    
    MOV AH, 4CH
    INT 21H
    MAIN ENDP
END MAIN