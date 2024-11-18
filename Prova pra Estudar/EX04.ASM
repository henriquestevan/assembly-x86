; Escreva um procedimento em assembly que possibilite a entrada de um número, sem sinal, na base octal e devolva este valor em AX.
TITLE ENTRADA-OCTAL

.MODEL SMALL
.DATA
    MsgLeitura DB 'Digite um numero em octal: $'
.CODE
    MAIN PROC
        MOV AX, @DATA 
        MOV DS, AX
    
        CALL READ

        MOV AH, 4Ch
        INT 21h

    MAIN ENDP
    
    READ PROC
        MOV AH, 9
        LEA DX, MsgLeitura
        INT 21h
        MOV AH, 1
        XOR BX, BX 
        MOV CX, 5
        LOOP_LABEL:
            INT 21h
            CMP AL, 0Dh
            JE CONTINUA
            AND AL, 0Fh
            SHL BX, 3
            OR BL, AL
            LOOP LOOP_LABEL
            CONTINUA:
                MOV AX, BX
                RET
            
    READ ENDP
END MAIN 