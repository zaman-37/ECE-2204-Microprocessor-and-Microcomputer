; unconditional JUMP  
; JMP keyword

; conditional jump
; CMP keyword

;CMP COMPARED TO, COMPARED WITH
;CMP BX, CX   ; meaning is BX > OR < CX OR ==



;JE/JZ          jump equal or jump zero                     ZF
;JNE/JNZ        jump not equal or jump not zero             ZF
;JG/JNLE        jump greater or jump not less/equal         OF, SF, ZF
;JGE/JNL        jump greater/equal or  jump not less        OF, SF
;JL/JNGE        jump less or jump not greater/equal         OF, SF
;JLE/JNG        jump less/equal or jump not greater         OF, SF, ZF
 
 
;JE/JZ          jump equal or jump zero                     ZF
;JNE/JNZ        jump not equal or jump not zero             ZF
;JA/JNBE        jump above or jump not below/equal          CF, ZF
;JAE/JNB        jump avobe/equal or jump not below          CF
;JB/JNAE        jump below or jump not above/below          CF
;JBE/JNA        jump below/equal or jump not above          AF, CF
                                                               
    
;JCXZ           jump if CX is zero none
;JC             jump if carry                               CF
;JNC            jump if no carry                            CF
;JO             jump if overflow                            OF
;JNO            jump if not overflow                        OF
;JP/JPE         jump parity or jump parity even             PF
;JNP/JPO        jump not parity or jump parity odd          PF
;JS             jump sign (negative value)                  SF
;JNS            jump no signe (positive value)              SF

INCLUDE "EMU8086.INC"
.MODEL SMALL
.STACK 100H
.DATA
           

.CODE

MAIN PROC
    ;unconditional jump .......................................
    ;START: 
    ;PRINTN "HERE"
    ;JMP START  
    
    INC BX ; Means: BX = BX + 1
    DEC BX ; Means: BX = BX - 1
    
    MOV BX, 0 ; Initialization
    MOV CX, 5 ; Given number(which will not be changed)
    
    START:
    CMP BX, CX  ; condition check
    JE LAST     ; contitional jump ............................
    PRINTN "HELLO WORLD"
    INC BX
    JMP START
    
    LAST: 
    PRINTN "THE PROGRAM IS ENDED"
    
    MOV AH, 4CH
    INT 21H
    MAIN ENDP
END MAIN