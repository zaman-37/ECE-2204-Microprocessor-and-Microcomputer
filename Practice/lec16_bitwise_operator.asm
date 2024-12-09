INCLUDE "EMU8086.INC"
.MODEL SMALL
.STACK 100H
.DATA


.CODE 
MAIN PROC
    ; AND operator
    MOV BH, 1111B ; 1111B = 15 in decimal 
    AND BH, 0100B ; 0100B = 4 in decimal
                  ; 1000B = 4
    ADD BH, 48
    MOV AH, 2
    MOV DL, BH
    INT 21H  
    
    PRINTN
    ; OR operator
    MOV BH, 101B ; 101B = 5 in decimal 
    OR BH, 011B  ; 011B = 3 in decimal
                 ; 111B = 7
    ADD BH, 48
    MOV AH, 2
    MOV DL, BH
    INT 21H 
    
    PRINTN 
    ; XOR operator   (when xor operartion is done with same variable then all bit become cleared)
    MOV BH, 0101B   ; 0101B = 5 in decimal 
    XOR BH, 0011B   ; 0011B = 3 in decimal
                    ; 0110B = 6
    ADD BH, 48
    MOV AH, 2
    MOV DL, BH
    INT 21H
    
    MOV AH, 4CH
    INT 21H
    MAIN ENDP
END MAIN          
            

    ; There are more bitwise operator:
    ; NOT, SHL(left shift), SHR(right shift), ROL(rotate left), ROR, RCL(rotate carry left), 
    ; RCR(rotate carry right), 