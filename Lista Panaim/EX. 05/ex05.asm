;Faça um programa que leia a diagonal principal de uma matriz 4X4 tamanho DB

TITLE SOMA-DIAGONAL-PRINCIPAL
.MODEL SMALL
.STACK 100h
.DATA
    MATRIZ DB 12 DUP(?)    ; Matriz 3x3 armazenada linearmente
    MsgLeitura DB 'Digite o elemento da posicao $'
    MsgImpressao DB 'Soma da diagonal principal: $'

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

        CALL LerMatriz      ; Chama procedimento para ler matriz
        CALL Somador        ; Chama procedimento para somar a diagonal principal
        CALL ImprimirSoma   ; Chama procedimento para imprimir a soma da diagonal principal

        MOV AH, 4Ch
        INT 21h
    MAIN ENDP

    ; PROCEDIMENTO DE LEITURA DA MATRIZ
    LerMatriz PROC
        XOR SI, SI       ; Inicializa o índice da coluna
        XOR BX, BX       ; Inicializa o índice da linha
        MOV CL, 3        ; Controla o número de linhas

        FORL: 
            PularLinha
            MOV CH, 3           ; Controla o número de colunas
            FORC: 
                LerElemento      ; Lê um elemento do teclado
                XOR DX, DX       ; Limpa DX
                MOV DL, AL       ; Coloca o valor lido em DL (AL contém o número lido)
                ; Calcula o índice da matriz
                MOV DI, BX      ; DI = índice da linha
                SHL DI, 1       ; DI = DI * 2
                ADD DI, BX      ; DI = DI + BX, resultando em 3 * linha
                ADD DI, SI      ; DI = DI + coluna (SI)
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

    Somador PROC
        MOV CX, 3               ; Passa para CX a quantidade de linhas/colunas da matriz para o loop
        XOR BX, BX              ; Zera BX para salvar as posições da linha/coluna
        XOR SI, SI              ; Zera SI para manipulação da matriz   
        XOR DI, DI              ; Zera DI para servir como contador da soma
        ForLoop:
            MOV SI, BX          ; SI = índice da linha
            SHL SI, 1           ; SI = SI * 2
            ADD SI, BX          ; SI = SI + BX, resultando em 3 * linha
            ADD SI, BX          ; SI = SI + coluna (BX)
            MOV AL, MATRIZ[SI]  ; Passa o valor lido da pos SI para AL
            AND AX, 000Fh       ; Redefine AX deixando apenas o valor númerico em AL
            ADD DI, AX          ; Adiciona o valor ao contador
            INC BX              ; Próxima posição
            LOOP ForLoop        ; Repete até CX=0
        RET
    Somador ENDP

    ImprimirSoma PROC
        PularLinha
        PularLinha
        MOV AH, 9               ; Impressão de string           
        LEA DX, MsgImpressao    ; OFFSET MsgImpressão para DX
        INT 21h                 ; Executa impressão
        MOV AH, 2               ; Impressão de caractere
        OR DI, 0030h            ; Número para caractere numérico
        MOV DX, DI              ; DX recebe a soma
        INT 21h                 ; Executa a impressão
        RET
    ImprimirSoma ENDP
END MAIN