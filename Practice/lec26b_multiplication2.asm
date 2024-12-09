INCLUDE "EMU8086.INC"
.MODEL SMALL
.STACK 100H
.DATA

.CODE 
MAIN PROC
    MOV AX, @DATA
    MOV DS, AX
     
    CALL MULTIPLICATION
    
    MOV AH, 4CH
    INT 21H
MAIN ENDP

MULTIPLICATION PROC   
    ; taking input
    ;PRINT "ENTER FIRST NUMBER: "
    MOV AH, 1
    INT 21H
    MOV BL, AL 
    SUB BL, 48
    PRINTN
    
    ;PRINT "ENTER SECOND NUMBER: "
    MOV AH, 1 
    INT 21H
    MOV CL, AL
    SUB CL, 48
    
    ; multiplication ... ... ... 
    XOR DL, DL       ; Clear DL for the result
    MOV AL, BL       ; Move BL to AL for multiplication

MULT:        
    TEST CL, 01H     ; Check the least significant bit of CL
    JZ SKIP_ADD      ; If LSB of CL is 0, skip the addition
    ADD DL, AL       ; If LSB of CL is 1, add AL to DL

SKIP_ADD:
    SHL AL, 1        ; Shift AL left by 1 (AL = AL * 2)
    SHR CL, 1        ; Shift CL right by 1 (next bit to LSB)
    JNZ MULT         ; If CL is not zero, repeat the loop

MULT_EXIT:
    ; Convert result in DL to ASCII
    ;ADD DL, 48
    
    ; output
    PRINTN
    PRINT "OUTPUT: "
    MOV AH, 2
    INT 21H          ; Print the result in DL
    
    RET
MULTIPLICATION ENDP

END MAIN
