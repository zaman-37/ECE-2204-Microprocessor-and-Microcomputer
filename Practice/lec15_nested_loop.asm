; NESTED LOOP

;* * * *
;* * * *
;* * * *
;* * * *

INCLUDE "EMU8086.INC"
.MODEL SMALL
.STACK 100H
.DATA
    N DB ?

.CODE 
MAIN PROC
    
    MOV AX, @DATA
    MOV DS, AX
    
    ; taking input
    MOV AH, 1
    INT 21H
    SUB AL, 48 
    MOV N, AL     
    PRINTN
    
    ; nested loop
    MOV BH, 1 ; initialization 
    LOOP1:
        CMP BH, N
        JG LOOP1_EXIT
        MOV BL, 1 ; initialization  (for upper triangle initialize BL with BH)
        LOOP2:   
                CMP BL, N     ; for lower triangle compare BL with BH
                JG LOOP2_EXIT
                
                MOV AH, 2
                PRINT "*"
                INT 21H
            
                INC BL
                JMP LOOP2
        LOOP2_EXIT:  
        PRINTN
        INC BH
        JMP LOOP1
    LOOP1_EXIT:
        
                
    
      
    
    
    MOV AH, 4CH
    INT 21H
    MAIN ENDP
END MAIN