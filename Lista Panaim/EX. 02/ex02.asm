;Faça um programa que leia a diagonal principal de uma matriz 4X4 tamanho DB

TITLE LEITURA-DIAGONAL-PRINCIPAL
.MODEL SMALL
.STACK 100h
.DATA
    MATRIZ DB 16 DUP(?)    ; Matriz 4x4 armazenada linearmente
    MsgLeitura DB 'Digite o elemento da posicao $'
    MsgImpressao DB 'Matriz principal: $'

    PularLinha MACRO
        MOV AH, 2       ; Impressão de caractere
        MOV DL, 0Ah     ; Código ASCII para linhagem
        INT 21h         ; Executa instrução
        MOV DL, 0Dh     ; Código ASCII para carry return(enter)
        INT 21h
    ENDM

    Space MACRO
        MOV AH, 2       ; Impressão
        MOV DX, 20h     ; 20h = código ASCII para spacebar
        INT 21h
    ENDM

    LerElemento MACRO
        PularLinha
        ; Impressão da string
        MOV AH, 09h     
        LEA DX, MsgLeitura
        INT 21h
        MOV AH, 02h     ; Impressão de caractere
        MOV DX, BX      ; Passa número da linha para DX
        INC DX          ; Incrementa o número da linha para melhor compreensão do usuário
        OR DX, 30h      ; Número para caractere numérico
        INT 21h         ; Imprime o indíce da linha
        MOV DX, SI      ; Passa o número da coluna para DX
        INC DX          ; Incrementa o número da coluna para melhor compreensão do usuário
        OR DX, 30h      ; Número para caractere numérico
        INT 21h         ; Imprime o indíce da coluna
        Space
        MOV AH, 01h     ; Função para ler um caractere
        INT 21h         ; Caracter lido em AL
    ENDM

.CODE
    MAIN PROC
        MOV AX, @DATA
        MOV DS, AX

        CALL LerMatriz  ; Chama procedimento para ler matriz
        CALL ImprimirDiagonal ; Chama procedimento para imprimir diagonal principal

        MOV AH, 4Ch
        INT 21h
    MAIN ENDP

    ; PROCEDIMENTO DE LEITURA DA MATRIZ
    LerMatriz PROC
        XOR SI, SI       ; Inicializa o índice da coluna
        XOR BX, BX       ; Inicializa o índice da linha
        MOV CL, 4        ; Controla o número de linhas

        FORL: 
            PularLinha
            MOV CH, 4           ; Controla o número de colunas
            FORC: 
                LerElemento      ; Lê um elemento do teclado
                XOR DX, DX       ; Limpa DX
                MOV DL, AL       ; Coloca o valor lido em DL (AL contém o número lido)
                ; Calcula o índice da matriz
                MOV DI, BX       ; DI = índice da linha (BX)
                SHL DI, 2        ; Multiplica BX por 4 (para acessar a linha correta)
                ADD DI, SI       ; DI = DI + SI (índice da coluna)
                MOV MATRIZ[DI], DL  ; Armazena o valor na posição correta

                DEC CH           ; Decrementa o contador de colunas
                INC SI           ; Incrementa o índice da coluna
                CMP CH, 0        ; Verifica se o loop interno terminou
                JNE FORC

                DEC CL           ; Decrementa o contador de linhas
                XOR SI, SI       ; Reseta o índice da coluna
                INC BX           ; Incrementa o índice da linha
                CMP CL, 0        ; Verifica se o loop externo terminou
                JNE FORL
        RET
    LerMatriz ENDP

    ImprimirDiagonal PROC
        PularLinha
        MOV AH, 09h
        LEA DX, MsgImpressao
        INT 21h
        XOR BX, BX
        MOV AH, 2
        MOV CX, 4
        FOR:
            MOV SI, BX
            SHL SI, 2
            ADD SI, BX
            MOV Dl, MATRIZ[SI]
            INT 21h
            INC BX
            Space
            LOOP FOR
        RET
    ImprimirDiagonal ENDP
END MAIN