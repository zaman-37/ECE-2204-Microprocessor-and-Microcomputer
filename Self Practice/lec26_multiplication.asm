INCLUDE "EMU8086.INC"
.MODEL SMALL
.STACK 100H
.DATA

.CODE 
MAIN PROC
    MOV AX, @DATA
    MOV DS, AX
     
    CALL MULTIPLICATION
    
    MOV AH, 4CH
    INT 21H
MAIN ENDP

MULTIPLICATION PROC   
    ; taking input
    PRINT "ENTER FIRST NUMBER: "
    MOV AH, 1
    INT 21H
    MOV BL, AL 
    SUB BL, 48
    PRINTN
    
    PRINT "ENTER SECOND NUMBER: "
    MOV AH, 1 
    INT 21H
    MOV CL, AL
    SUB CL, 48
    
    ; multiplication ... ... ... 
    XOR DL, DL
    MULT:        
        CMP CL, 0
        JE MULT_EXIT
        
        SHR CL, 1  
        JNC SHIFT  
        ADD DL, BL
        
        SHIFT:
        SHL BL, 1
        
        JMP MULT: 
    MULT_EXIT:
    
    ; output
    PRINTN
    PRINT "OUTPUT: "
    MOV AH, 2
    INT 21H
    
    RET
MULTIPLICATION ENDP

END MAIN