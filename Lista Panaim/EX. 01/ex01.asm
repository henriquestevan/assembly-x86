; Faça um programa que conte quantas letras “A” tem em um nome guardado num vetor de tamanho 20

TITLE ContadorCaractere
.MODEL SMALL
.STACK 100h
.DATA
    Vetor DB 20 DUP(?)
    MsgLeitura DB 'Digite uma palavra de ate 20 letras(pressione enter para encerrar a leitura): $'
    MsgImpressao DB 'Quantidade de A: $'
    PularLinha MACRO
        MOV AH, 2       ; Impressão de caractere
        MOV DL, 0Ah     ; Código ASCII para linhagem
        INT 21h         ; Executa instrução
        MOV DL, 0Dh     ; Código ASCII para carry return(enter)
        INT 21h
    ENDM
.CODE
    
    MAIN PROC
        MOV AX, @DATA
        MOV DS, AX

        CALL LerString
        CALL VerificarCaractere
        CALL ImprimirSoma

        MOV AH, 4Ch
        INT 21h
    MAIN ENDP

    LerString PROC
        XOR BX, BX
        MOV CX, 20
        MOV AH, 9
        LEA DX, MsgLeitura
        INT 21h
        MOV AH, 1
        ForRead:
            INT 21h
            CMP AL, 0Dh
            JE FimScan
            MOV VETOR[BX], AL
            INC BX
            LOOP ForRead
        FimScan:
            RET
    LerString ENDP

    VerificarCaractere PROC
        XOR BX, BX
        XOR AX, AX
        MOV CX, 20
        ForVerify:
            MOV DL, VETOR[BX]
            CMP DL, 'A'
            JE INCREMENTA
            CMP DL, 'a'
            JNE CONTINUA
            INCREMENTA:
                INC AX
            CONTINUA:
                INC BX
                LOOP ForVerify
        RET
    VerificarCaractere ENDP

    ImprimirSoma PROC
        MOV CX, AX
        PularLinha
        MOV AH, 9
        LEA DX, MsgImpressao
        INT 21h
        MOV AH, 2
        MOV DX, CX
        OR DL, 30h
        INT 21h
        RET
    ImprimirSoma ENDP
END MAIN