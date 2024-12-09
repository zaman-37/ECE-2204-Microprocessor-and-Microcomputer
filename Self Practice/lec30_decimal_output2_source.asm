INCLUDE "EMU8086.INC"
.MODEL SMALL
.STACK 100H
.DATA
    N DB 0
    COUNT DB 0
.CODE 
    MAIN PROC
        MOV AX, @DATA
        MOV DS, AX 
        
        XOR CX, CX ; counter
        XOR DX, DX ; To store the number...
        
        CALL DECIMAL_INPUT 
        PRINTN
        MOV AH, 2
        INT 21H  
        
        PRINTN 
        MOV N, DL      ; storing the number to N from DL
        CALL DECIMAL_OUTPUT
        
        MOV AH, 4CH
        INT 21H
    MAIN ENDP
    
    DECIMAL_INPUT PROC
        PRINT "INPUT: "
        INPUT: 
            MOV AH, 1
            INT 21H
            CMP AL, 0DH
            JE INPUT_EXIT
            
            INC COUNT ; counter ...
            SUB AL, 48
            MOV N, AL 
            
            MOV AL, 10
            MUL DL     ; the result will be stored in AX. sign part in AH, and result part in AL
             
            MOV DL, AL
            ADD DL, N
            JMP INPUT
            
        INPUT_EXIT:    
        
        RET
    DECIMAL_INPUT ENDP   
    
    DECIMAL_OUTPUT PROC
        PRINT "OUTPUT: "
        XOR AX, AX
        XOR BX, BX
        XOR DX, DX
        
        
        XOR CX,CX
        MOV CL, COUNT
        
        MOV BL, 10
        XOR AH, AH
        MOV AL, N  
        
        FOR2:
            DIV BL
            XOR DX, DX
            MOV DL, AH
            ADD DL, 48
            PUSH DX
        LOOP FOR2
        
        XOR CX, CX
        MOV CL, COUNT  
        
        
        FOR3:  
            XOR DX, DX
            POP DX
            MOV AH, 2
            INT 21H
        LOOP FOR3 
        
        RET
    DECIMAL_OUTPUT ENDP
END MAIN