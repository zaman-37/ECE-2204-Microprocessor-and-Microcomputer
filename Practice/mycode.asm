.MODEL SMALL 
.STACK 200H
.DATA
    ; WHERE ALL THE VARIABLE WILL BE DECLERED.
    ; BH, BL 8 bits register - 1 byte
    ; BX 16 bits register - 1 word 
    
    
 


.CODE
    ;CODE SEGMENT   (WHERE MAIN AND USER DEFINED PROCEDURE WILL BE CREATED IN THIS SECTION)
    
    MAIN PROC   ;CALLING MAIN FUNCTION...
        ;STATEMENT...
        ;...    ...     ...
        ;...    ...     ...
        
        MOV AH , 4CH
        INT 21H
    MAIN ENDP


END MAIN ;EXIT(0)                                                      