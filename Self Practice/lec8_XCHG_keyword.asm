; XCHG key word

.MODEL SMALL 
.STACK 100H
.DATA


.CODE

MAIN PROC
    
    MOV BL, 53
    MOV BH, 55
    
    XCHG BL, BH ; 5 and 7 will be swaped ( BH and BL will be swaped)
    
    ; printing BL
    MOV AH, 2
    MOV DL, BL
    INT 21H 
    
    ; new line
    MOV AH, 2
    MOV DL, 0AH
    INT 21H
    MOV DL, 0DH
    INT 21H
    
    ; printing BH
    MOV AH, 2
    MOV DL, BH
    INT 21H
    
    MOV AH, 4CH
    INT 21H
    MAIN ENDP
END MAIN