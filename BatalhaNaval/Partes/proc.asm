TITLE PROCEDIMENTO-LEITURA
.MODEL SMALL
.DATA 
    msg1 DB 'Digite uma letra(linha): $' 
    msg2 DB 10,13,'Digite um numero(coluna, de 0 a 9): $'
    msg3 DB 10,13,'O valor numérico da letra e: $'
    msg4 DB 10,13,'O numero digitado foi: $'

.CODE 
    MAIN PROC 
        MOV AX,@DATA
        MOV DS,AX

        MOV AH,09h
        LEA DX,msg1
        INT 21h

        ;Lê um caractere do teclado
        MOV AH,01h
        INT 21h

        PUSH AX

        MOV AH,09h
        LEA DX,msg2
        INT 21h

        ;Lê um caractere do teclado
        MOV AH,01h
        INT 21h

        MOV BH,AL
        OR BH,30h

        XOR AX,AX

        POP AX
        

    COMPARA:
        ; Verifica se o caractere está entre 'A' e 'Z' ou 'a' e 'z'
        ; Para maiúsculo
        CMP AL, 'A'
        JB  NAO_LETRA    ; Se for menor que 'A', não é letra 
        CMP AL, 'Z'
        JA  NAO_LETRA    ; Se for maior que 'Z', não é letra

        ; Converte a letra maiúscula para seu valor numérico
        SUB AL, 'A'      ; 'A' vira 0, 'B' vira 1, ..., 'Z' vira 25
        MOV BL, AL       ; Armazena o valor numérico em BL
        JMP EXIBE_RESULTADO

    NAO_LETRA:
        ; Para minúsculo
        CMP AL, 'a'
        JB  FIM          ; Se for menor que 'a', não é letra
        CMP AL, 'z'
        JA  FIM          ; Se for maior que 'z', não é letra

        ; Converte a letra minúscula para seu valor numérico
        SUB AL, 'a'      ; 'a' vira 0, 'b' vira 1, ..., 'z' vira 25
        MOV BL, AL       ; Armazena o valor numérico em BL

    EXIBE_RESULTADO:
        ; Exibe a mensagem com o valor numérico da letra
        MOV AH, 09h
        LEA DX, msg3
        INT 21h

        ; Exibe o valor numérico (em BL)
        MOV AH, 02h
        ADD BL, '0'      ; Converte o número para caractere
        MOV DL,BL
        INT 21h

        ; Exibe a mensagem com o valor numérico da letra
        MOV AH, 09h
        LEA DX, msg4
        INT 21h

        ; Exibe o valor numérico (em BL)
        MOV AH, 02h
        MOV DL,BH
        INT 21h

    FIM:
        MOV AH,4Ch
        INT 21h

    MAIN ENDP
END MAIN
