INCLUDE "EMU8086.INC"
.MODEL SMALL
.STACK 100H
.DATA
    N DW 0           ; To store the final decimal number
    INPUT_MSG DB 'Enter a hexadecimal number: $'  ; Message for input prompt
    OUTPUT_MSG DB 'The decimal value is: $'      ; Message for output prompt
    NEWLINE DB 0AH, 0DH, '$'   ; Newline character for formatting

.CODE 
    MAIN PROC
        MOV AX, @DATA
        MOV DS, AX 
        
        ; Initialize registers
        XOR DX, DX    ; Clear DX (for accumulation)

        ; Display the input prompt
        MOV AH, 09H
        LEA DX, INPUT_MSG
        INT 21H

        ; Get user input as a hexadecimal number
        CALL HEX_INPUT

        ; Store the result in `N`
        MOV [N], DX

        ; Display a newline after input
        MOV AH, 09H
        LEA DX, NEWLINE
        INT 21H

        ; Display the output prompt
        MOV AH, 09H
        LEA DX, OUTPUT_MSG
        INT 21H

        ; Display the decimal output
        CALL DECIMAL_OUTPUT

        ; Display a newline after the output
        MOV AH, 09H
        LEA DX, NEWLINE
        INT 21H

        ; Exit the program
        MOV AH, 4CH
        INT 21H
    MAIN ENDP
    
    HEX_INPUT PROC
        XOR DX, DX    ; Clear DX to store the number

        INPUT_LOOP: 
            MOV AH, 1  ; DOS interrupt to read a character
            INT 21H
            CMP AL, 0DH ; Check if Enter key (Carriage Return) is pressed
            JE INPUT_EXIT
            
            ; Convert ASCII to hexadecimal digit
            CMP AL, '0'
            JB NOT_HEX    ; If less than '0', it's not a valid hex digit
            CMP AL, '9'
            JBE VALID_DIGIT
            CMP AL, 'A'
            JB NOT_HEX    ; If less than 'A', it's not a valid hex digit
            CMP AL, 'F'
            JBE VALID_DIGIT
            CMP AL, 'a'
            JB NOT_HEX    ; If less than 'a', it's not a valid hex digit
            CMP AL, 'f'
            JBE VALID_DIGIT
            JMP NOT_HEX    ; If greater than 'f', it's invalid

        VALID_DIGIT:
            ; Convert '0'-'9' to 0-9, 'A'-'F' to 10-15
            SUB AL, '0'     ; Convert '0'-'9' to 0-9
            CMP AL, 9
            JBE STORE_DIGIT
            SUB AL, 7       ; Convert 'A'-'F' to 10-15
        STORE_DIGIT:
            ; Multiply the accumulated number by 16 and add the new digit
            MOV AH, DL      ; Move previous result to AH
            SHL DX, 4       ; Multiply the result by 16 (shift left by 4 bits)
            ADD DL, AL      ; Add the new digit

            JMP INPUT_LOOP

        NOT_HEX:
            JMP INPUT_LOOP

        INPUT_EXIT:
        RET
    HEX_INPUT ENDP   

    DECIMAL_OUTPUT PROC
        MOV AX, [N]    ; Load the stored number into AX
        XOR DX, DX     ; Clear DX
        XOR CX, CX     ; Clear counter
        MOV BX, 10     ; Base 10
        
        ; Count digits for stack storage
        COUNT_DIGITS:
            XOR DX, DX
            DIV BX      ; Divide AX by 10
            PUSH DX     ; Store remainder on the stack
            INC CX      ; Increment counter
            CMP AX, 0
            JNZ COUNT_DIGITS
            
        ; Output digits from the stack
        OUTPUT_DIGITS:
            POP DX
            ADD DL, '0' ; Convert to ASCII
            MOV AH, 2   ; Print the digit
            INT 21H
        LOOP OUTPUT_DIGITS
        
        RET
    DECIMAL_OUTPUT ENDP
END MAIN
