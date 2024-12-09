INCLUDE "EMU8086.INC"
.MODEL SMALL
.DATA
    STORE_DX DW ?
    STORE_AX DW ?
.CODE 

    MAIN PROC
        MOV AX, @DATA
        MOV DS, AX 
        ; MUL , IMUL  : These two keywords are used to multiply two number.......
        
        ;MULTIPLIER = 10
        ;MULTIPLICANT = 9
        
        MOV BX, 1
        MOV AX, 1111111111111111B   
        iMUL BX  ; DX:AX = AX*BX 
        
        ; To work with 8 bit, the formate is:
        ; MOV AL, 9
        ; MOV BL, 10
        ; MUL BL    ; AH:AL = AL*BL
        
        MOV STORE_DX, DX
        MOV STORE_AX, AX
        CALL PRINT_PRODUCT
        
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
    
    
    PRINT_PRODUCT PROC 
        MOV BX, STORE_DX
        CALL PRINT_HEX  
        
        PRINT " "
        
        MOV BX, STORE_AX
        CALL PRINT_HEX
        
        RET 
    PRINT_PRODUCT ENDP
    
END MAIN