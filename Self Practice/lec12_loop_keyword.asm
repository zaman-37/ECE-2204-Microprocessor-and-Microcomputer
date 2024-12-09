;loop keyword

INCLUDE "EMU8086.INC"
.MODEL SMALL
.STACK 100H
.DATA 


.CODE 

MAIN PROC 
    
    ;for (int i=n; i>0; i--)
    MOV CX, 10
    
    TOP: 
    ;statements
    PRINTN "LOOP IS RUNNING" 
    LOOP TOP  ; i-- , i>0
    
    PRINTN "LOOP ENDED"
    
    MOV AH, 4CH
    INT 21H
    MAIN ENDP
END MAIN