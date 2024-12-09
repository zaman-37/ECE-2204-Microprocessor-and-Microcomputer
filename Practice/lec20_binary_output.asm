; binary output


INCLUDE "EMU8086.INC"
.MODEL SMALL
.STACK 100H
.DATA
    COUNT DB 0

.CODE 
MAIN PROC
    ; clear a register BX to store the data
    ; loop start
    ; input 0/1
    ; check if it's enter?
    ; BX SHL
    ; store the input in BX register at LSB bit
       
    MOV AX, @DATA
    MOV DS, AX
    
    MOV BX, 0
    ; taking the binary input using loop  
    PRINT "INPUT: "
    FOR: 
        MOV AH, 1
        INT 21H
        CMP AL, 0DH
        JE FOR_END
        
        SUB AL, 48
        SHL BX, 1
        OR BL, AL
        INC COUNT  
        
        JMP FOR
    FOR_END:
    
    ; output of the binary number
    PRINTN
    PRINT "OUTPUT: "   
    
    ; taking msb at the starting point
    MOV CL, 16
    SUB CL, COUNT
    RCL BX, CL
    
    XOR CX, CX ; making CX = 0  
    ;MOV CH, 1
    MOV CL, COUNT
    FOR2:    
        
        RCL BX, 1
        JC OUT_ONE
        PRINT '0'
        JMP LAST
        
        OUT_ONE: 
        PRINT '1' 
        
        LAST: 
    LOOP FOR2
    
    MOV AH, 4CH
    INT 21H
    MAIN ENDP
END MAIN