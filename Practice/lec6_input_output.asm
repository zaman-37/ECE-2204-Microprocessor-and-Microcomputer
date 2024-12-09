.MODEL SMALL
.STACK 100H
.DATA
    ; Variable will be declecrad
    NUM DB 49 
    MSG DB "KAMRU$"
    
    
.CODE 
    
MAIN PROC 
    ; taking input. and input will be stored in AL resistor
    MOV AH, 1
    INT 21H
    
    ; printing the AL resistor
    MOV AH, 2
    MOV DL, AL
    INT 21H    
        
        
    MOV AH, 4CH
    INT 21H
    MAIN ENDP
    
END MAIN
        
        
        
                                                                                             