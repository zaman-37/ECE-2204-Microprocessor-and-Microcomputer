; reversing a string using stack... ... ... ...

INCLUDE "EMU8086.INC"
.MODEL SMALL
.STACK 100H
.DATA


.CODE 
MAIN PROC 
    MOV AX, @DATA
    MOV DS, AX
    
    XOR CX, CX
    PRINT "INPUT: "
    INPUT:
        MOV AH, 1
        INT 21H   
        CMP AL, 0DH
        JE INPUT_EXIT 
        
        PUSH AX
        INC CX
        
        JMP INPUT
    INPUT_EXIT:  
           
           
    PRINTN
    PRINT "OUTPUT: "
    OUTPUT: 
        POP DX
        MOV AH, 2   
        INT 21H
    LOOP OUTPUT
    
    MOV AH, 4CH
    INT 21H
    MAIN ENDP
END MAIN