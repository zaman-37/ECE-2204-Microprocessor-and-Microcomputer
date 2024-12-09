INCLUDE "EMU8086.INC"
.MODEL SMALL
.STACK 100H
.DATA
    NUMBER DB 10 DUB (?)
.CODE
    MAIN PROC
        MOV AX, @DATA
        MOV DS, AX
        
        XOR CX, CX
        MOV CX, 10 
        MOV BX, 0
        
        FOR:
            MOV AH, 1
            INT 21H 
            MOV NUMBER[BX], AL   
            INC BX
        LOOP FOR
        
        PRINTN  
        PRINT "OUTPUT: "
        
        MOV CX, 10
        MOV BX, 0
        FOR2:
            MOV AH, 2
            MOV DL, NUMBER[BX]
            INT 21H
            INC BX  
        LOOP FOR2  
        
        
        MOV AH, 4CH
        INT 21H
    MAIN ENDP

END MAIN