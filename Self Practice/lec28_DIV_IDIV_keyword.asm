INCLUDE "EMU8086.INC"
.MODEL SMALL
.DATA
    STORE_DX DW ?
    STORE_AX DW ?
.CODE 

    MAIN PROC
        MOV AX, @DATA
        MOV DS, AX 
        ; DIV , IDIV  : These two keywords are used to multiply two number.......
        
        ;DIVIDEND = 5
        ;DIVISOR = 2
        
        MOV BX, 2
        MOV AX, 5   
        DIV BX  ; DX:AX = AX/BX   ;; DX = remainder   ;; AX = result 
        
        ; To work with 8 bit, the formate is:
        ; MOV AL, 9
        ; MOV BL, 10
        ; DIV BL    ; AH:AL = AL/BL   ;; AH = remainder  ;; AL = result
        
        MOV STORE_DX, DX
        MOV STORE_AX, AX
        CALL PRINT_DIVITION
        
        MOV AH, 4CH
        INT 21H
    MAIN ENDP   
    
    
    PRINT_HEX PROC
        ; XOR CH, CH
        MOV CX, 4
        MOV AH, 2
        
        FOR2:
            MOV DL, BH
            SHR DL, 4
            SHL BX, 4
            
            CMP DL, 10
            JGE LETTER2:
            
            ;DIGIT
            ADD DL, 48
            INT 21H
            JMP END_OF_LOOP2
            
            LETTER2:
            ADD DL, 55
            INT 21H
            
            END_OF_LOOP2:
        LOOP FOR2
        
        RET
    PRINT_HEX ENDP 
    
    
    PRINT_DIVITION PROC 
        MOV BX, STORE_DX
        CALL PRINT_HEX  
        
        PRINT " "
        
        MOV BX, STORE_AX
        CALL PRINT_HEX
        
        RET 
    PRINT_DIVITION ENDP
    
END MAIN