
; You may customize this and other start-up templates; 
; The location of this template is c:\emu8086\inc\0_com_template.txt

org 100h

MOV AX, 1000H
MOV DS, AX
MOV SI, 0500H
MOV DI, 0600H

MOV CX, [SI]
SUB CX, 02H

MOV AL, 00H
MOV [DI], AL
INC AL 
INC DI
MOV [DI], AL

   
LOOP1:
MOV AL, [DI-1]
ADD AL, [DI]
INC DI
MOV [DI], AL
LOOP LOOP1

ret




