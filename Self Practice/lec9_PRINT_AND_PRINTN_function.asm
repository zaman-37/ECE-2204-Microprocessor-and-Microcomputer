; PRINT AND PRINTN function

INCLUDE 'EMU8086.INC'
.MODEL SMALL
.STACK 100H
.DATA 
    MSG DB "KAMRUZZAMAN$"    ; here string terminator ($) must be used

.CODE 

MAIN PROC
    
    ;PRINT = print a string without a new line.
    ;PRINTN = print a string with a new line. 
    PRINT "HELLO WORD"
    PRINT " BUY WORLD"
    
    ;new line
    MOV AH, 2
    MOV DL, 0AH
    INT 21H
    MOV DL, 0DH
    INT 21H
    
    PRINTN "HELLO WORD"
    PRINTN "BUY WORLD" 
    
    PRINTN ; a new line
    
    ; manually printing a string   
    MOV AX, @DATA
    MOV DS, AX
    
    MOV AH, 9
    LEA DX, MSG
    INT 21H
    
    
    MOV AH, 4CH
    INT 21H
    MAIN ENDP
END MAIN