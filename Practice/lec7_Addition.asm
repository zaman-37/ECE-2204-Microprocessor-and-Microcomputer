; take input A , B 
; show output A + B

.MODEL SMALL
.STACK 100H
.DATA 
    A DB ?
    B DB ?

.CODE 

MAIN PROC 
    ; taking input
    MOV AH, 1
    INT 21H
    MOV A, AL  
    SUB A, 48   ; A = A - 48
    
    ; taking input
    INT 21H
    MOV B, AL
    SUB B, 48   ; B = B - 48
    
    ; adding 
    MOV BH, A
    ADD BH, B
    ADD BH, 48 
    
    ; new line
    MOV AH, 2
    MOV DL, 0AH
    INT 21H
    MOV DL, 0DH
    
    ; printing
    ;MOV AH, 2 
    MOV DL, BH
    INT 21H
    
    MOV AH, 4CH
    INT 21H
    MAIN ENDP
END MAIN            



