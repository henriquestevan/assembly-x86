; Escreva um procedimento de montagem que leia um caractere do teclado e exiba na linha seguinte a quantidade de bits 1 existente 
; no código ASCII do caractere lido, O registrador que contém o caractere lido tem que ser zerado após uma verificação.
TITLE CONT-CARACTER
.MODEL SMALL
.DATA
    MsgLeitura DB 'Digite um caractere: $'
    MsgPrint DB 'Quantidade de bits 1: $'
.CODE
    MAIN PROC
        MOV AX, @DATA
        MOV DS, AX

        CALL ReadVerify

        MOV AH, 4Ch
        INT 21h    
    MAIN ENDP

    ReadVerify PROC
        READ:
            MOV AH, 9
            LEA DX, MsgLeitura
            INT 21h
            MOV AH, 1
            INT 21h
        XOR BX, BX
        MOV CX, 8
        Verify:
            SHR AL, 1
            JNC CONTINUA
            INC BL
            CONTINUA:
                LOOP Verify 
                XOR AH, AH
        Print:
            MOV AH, 2
            MOV DL, BL
            OR DL, 30h
            INT 21h
        RET
    ReadVerify ENDP
END MAIN