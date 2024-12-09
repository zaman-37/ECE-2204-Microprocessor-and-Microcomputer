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
        
        CALL DECIMAL_INPUT     ;; Taking decimal input ... ... ...
        PRINTN
        MOV AH, 2  
        MOV DL, N
        INT 21H     
        
        PRINTN 
        CALL DECIMAL_OUTPUT     ;; Decimal output ... ... ...
        
        MOV AH, 4CH
        INT 21H
    MAIN ENDP
    
    DECIMAL_INPUT PROC
        PRINT "INPUT: "
        INPUT: 
            XOR AX, AX
            MOV AH, 1
            INT 21H
            CMP AL, 0DH
            JE INPUT_EXIT
            
            INC COUNT      ; counter...
            SUB AL, 48
            XOR BL, BL
            MOV BL, AL     ; here BL is used as temporary variable to store the digit
            
            XOR AX, AX
            MOV AL, N
            MOV DL, 10
            MUL DL     ; the result will be stored in AX. sign part in AH, and result part in AL
             
            ADD AL, BL
            MOV N, AL
            JMP INPUT
            
        INPUT_EXIT: 
        RET
    DECIMAL_INPUT ENDP  
    
    
    DECIMAL_OUTPUT PROC
        PRINT "OUTPUT: "
        XOR CX, CX
        MOV CL, COUNT  
        XOR BX, BX  
        XOR AX, AX 
        
        MOV BL, 10
        MOV AL, N
        FOR: 
            
            DIV BL
            
            ;MOV N, AL 
            XOR DX, DX
            MOV DL, AH
            ADD DL, 48
            PUSH DX
            
        LOOP FOR 
        
        XOR AX, AX 
        XOR CX, CX
        MOV CL, COUNT
        FOR2:     
            XOR DX, DX
            POP DX
            MOV AH, 2  
            INT 21H
        LOOP FOR2                   
        
        RET
    DECIMAL_OUTPUT ENDP
END MAIN