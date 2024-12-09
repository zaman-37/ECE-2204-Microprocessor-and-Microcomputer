
; You may customize this and other start-up templates; 
; The location of this template is c:\emu8086\inc\0_com_template.txt



; add your code here  

MOV AX, 1000H
MOV DS, AX
MOV SI, 0500H
MOV DI, 0600H

MOV AX, 0001H
MOV CX, [SI] 
;MOV BX, 0001H

LOOP1:
MUL CX
;INC BX
LOOP LOOP1 

MOV [DI],AX     
;MOV [DI+1],AX

ret




