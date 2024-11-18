; Escreva um programa em assembly que tenha um procedimento que leia o nome completo do usuário do teclado e
; outro procedimento que exiba na linha seguinte as iniciais do nome do usuário
TITLE INCIAL-NOME
.MODEL SMALL
.DATA
    NOME DB 10 DUP(?)
    MsgLeitura DB 'Digite um nome: $'
    MsgPrint DB 'Iniciais: $'
    PularLinha MACRO
        PUSH AX
        PUSH DX

        MOV AH, 2
        MOV DX, 0Ah
        INT 21h
        MOV DX, 0Dh
        INT 21h

        POP DX
        POP AX
    ENDM
.CODE
    MAIN PROC
        MOV AX, @DATA
        MOV DS, AX

        CALL Read
        CALL VERIFY

        MOV AH, 4Ch
        INT 21h
    MAIN ENDP
    READ PROC
        MOV AH, 9
        LEA DX, MsgLeitura
        INT 21h
        MOV CX, 10
        XOR BX, BX
        MOV AH, 1
        ReadLabel:
            INT 21h
            MOV NOME[BX], AL
            INC BX
            LOOP ReadLabel
        RET
    READ ENDP
    VERIFY PROC
        PularLinha
        MOV AH, 9
        LEA DX, MsgPrint
        INT 21h
        MOV AH, 2
        XOR BX, BX
        MOV CX, 10
        VerifyLabel:
            CMP NOME[BX], 5Ah
            JG NORMAL
            CMP NOME[BX], 41h
            JL NORMAL
            MOV DL, NOME[BX]
            INT 21h
            NORMAL:
                INC BX
                LOOP VerifyLabel
        RET
    VERIFY ENDP
END MAIN