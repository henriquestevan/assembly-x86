; Escreva um procedimento de montagem que tenha um procedimento que calcule a somatória da diagonal principal de uma matriz de
; números 4 X 4, e armazene este valor em AX.
TITLE SOMATORIA-DIAGONAL-PRINCIPAL
.MODEL SMALL
.DATA
    MATRIZ DB 1,0,0,0
            DB 0,1,0,0
            DB 0,0,1,0
            DB 0,0,0,1
.CODE
    MAIN PROC
        MOV AX, @DATA
        MOV DS,AX

        CALL SOMATORIA
        
        MOV AH,4Ch
        INT 21h
    SOMATORIA PROC
        XOR BX, BX
        XOR AX, AX
        MOV CX, 4
        SOMA:
            MOV SI, BX
            SHL SI, 2
            ADD SI, BX
            ADD AL, MATRIZ[SI]
            INC BX
            LOOP SOMA
        RET
    SOMATORIA ENDP
    MAIN ENDP
END MAIN