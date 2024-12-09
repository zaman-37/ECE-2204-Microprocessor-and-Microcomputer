
; You may customize this and other start-up templates; 
; The location of this template is c:\emu8086\inc\0_com_template.txt

org 100h

; add your code here    
   
MOV AX, 0900H
MOV DS, AX
MOV SI, 0500H
MOV DI, 0600H    

MOV AX, 0000H
MOV BX, 0000H

MOV AX, [SI]
MOV BX, [SI+1]

DIV BX

MOV [DI], AX   
MOV [DI+2], DX

ret




