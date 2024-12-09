.MODEL SMALL 
.STACK 200H
.DATA
    ; WHERE ALL THE VARIABLE WILL BE DECLERED.
    ; BH, BL 8 bits register - 1 byte
    ; BX 16 bits register - 1 word 
    
    NUM DB 48
    CHAR DB 'A'
    MSG DB "My name is Kamruzzaman$"
 


.CODE
    ;CODE SEGMENT   (WHERE MAIN AND USER DEFINED PROCEDURE WILL BE CREATED IN THIS SECTION)
    
    MAIN PROC   ;CALLING MAIN FUNCTION...
        ;STATEMENT...
        ;...    ...     ...
        ;...    ...     ... 
        MOV AX, @DATA ; Importing all the data variable
        MOV DS, AX  
        
        ; number
        MOV AH, 2     ; To print a character of a number variable 
        MOV DL, NUM
        INT 21H   
        
        ; new line
        MOV AH, 2     ; New Line character printing 
        MOV DL, 0AH
        INT 21H
        MOV DL, 0DH
        INT 21H            
        
        ; character            
        MOV AH, 2
        MOV DL, CHAR 
        INT 21H 
        
        ; new line
        MOV AH, 2     ; New Line character printing 
        MOV DL, 0AH
        INT 21H
        MOV DL, 0DH
        INT 21H
        
        ; name
        MOV AH, 9
        LEA DX, MSG
        INT 21H
        
        
        MOV AH , 4CH
        INT 21H
    MAIN ENDP


END MAIN ;EXIT(0)                                                      