; Faça um programa que inverta um vetor (sem usar vetor auxiliar)

TITLE INVERTER-VETOR 

.MODEL SMALL 
.STACK 100h
.DATA 
    VETOR DB 7 DUP(?) ; Cria um vetor a partir do offset VETOR de 7 bytes preenchidos
    PulaLinha DB 10, 13, '$' 
.CODE 

MAIN PROC

    MOV AX, @DATA ;Conteúdo de DATA é direcionado para AX dentro de .CODE
    MOV DS, AX ;Endereço de AX é direcionado para o registrador DS
    
    MOV AH, 1 ; Leitura de caractere
    MOV CX, 7 ; Contador=7
    XOR BX, BX ; Zera BX
    LEITURA:
        CALL READ
    ESPAÇO:
        MOV AH, 9 ; Função de impressão de string
        LEA DX, PulaLinha ; OFFSET de PulaLinha é carregado em DX
        INT 21h ; Executa a função em AH
    MOV AH, 2 ; Função de impressão
    MOV CX, 7 ; Contador=7
    MOV DI, 6 ; Contador para a lógica de inversão
    XOR SI, SI ; Zera SI
    XOR DH, DH ; Zera DH
    INVERSOR:
        CALL INVERT
    IMPRESSÃO:
        CALL PRINT
    FIM:
        MOV AH, 4Ch 
        INT 21h 
MAIN ENDP 

READ PROC
    INT 21h ; Executa a função em AH
    XCHG VETOR[BX], AL ; Elemento BX do vetor recebe o conteúdo lido
    INC BX ; Passa para a próxima posição do vetor
    LOOP READ ; Repete até CX=0
    RET
READ ENDP

INVERT PROC
    CMP SI, DI ; Compara SI com DI
    JGE FIM1 ; Se SI>=DI, pula para a impressão
    XCHG AL, VETOR[SI] ;Caso contrário, troca o valor de AL pelo elemento SI do vetor
    XCHG DL, VETOR[DI] ;Troca o valor de DL pelo elemento DI do vetor
    ;Inverte a ultima com a primeira posição
    XCHG VETOR[SI], DL 
    XCHG VETOR[DI], AL 

    INC SI ;Soma 1 ao valor de SI
    DEC DI ;Decrementa 1 ao valor de DI
    JMP INVERT ;funciona como um loop até SI e DI serem iguais.
    FIM1:
        RET
INVERT ENDP

PRINT PROC
    MOV AL, DH ; Aloca o conteúdo de DH em AL
    LEA BX, VETOR ; Carrega o offset de VETOR em BX
    XLAT ; Troca o valor de AL pelo elemento que possui a posição DH do vetor

    INC DH ;Soma 1 ao valor de DH

    XCHG DL, AL ; Troca o AL com DL
    INT 21h ; Executa a impressão
    LOOP PRINT ; Repete até CX=0
    RET
PRINT ENDP
END MAIN 