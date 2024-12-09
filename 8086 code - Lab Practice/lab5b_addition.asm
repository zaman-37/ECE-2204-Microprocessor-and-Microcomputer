
; You may customize this and other start-up templates; 
; The location of this template is c:\emu8086\inc\0_com_template.txt

org 100h       



mov AX,1000h
mov DS,AX          
MOV DI, 600H
mov SI, 500h  

MOV AL, [SI]
INC SI
MOV BL, [SI]
ADD AL, BL
MOV [DI], AL

ret




