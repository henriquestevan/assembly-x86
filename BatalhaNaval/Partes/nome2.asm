TITLE LEITURA-NOME
.MODEL SMALL
.STACK 100h
.DATA
    Nome DB 10 DUP(?)                  ; Declara um vetor de 10 bytes para armazenar o nome
    MsgLeitura DB 'Digite o nome (ate 10 caracteres): $' ; Mensagem de entrada
    MsgExibir DB 10,13,'Nome armazenado: $'  ; Mensagem de exibição
    MsgSoma DB 10, 13, 'Soma dos valores ASCII: $' ; Mensagem para exibir a soma

.CODE
MAIN PROC
    MOV AX, @DATA                      ; Inicializa o segmento de dados
    MOV DS, AX

    ; Exibe mensagem de instrução
    MOV AH, 9
    LEA DX, MsgLeitura
    INT 21h

    ; Lê o nome e armazena em "Nome"
    MOV CX, 10                         ; Limita a leitura a 10 caracteres
    XOR BX, BX                         ; Usa BX como índice
    XOR AX, AX                         ; Zera AX para acumular a soma dos valores ASCII

    LeituraLoop:
        MOV AH, 1                          ; Função para ler um caractere
        INT 21h
        CMP AL, 13                         ; Verifica se o usuário pressionou "Enter" (código ASCII 13)
        JE FimLeitura
        MOV Nome[BX], AL                   ; Armazena o caractere no vetor

        MOV BL, AL                         ; Copia o valor de AL para BL
        XOR BH, BH                         ; Zera BH para tornar BX um valor de 16 bits com o ASCII em BL
        ADD AX, BX                         ; Soma o valor ASCII de AL (em BX) a AX

        INC BX                             ; Incrementa o índice
        LOOP LeituraLoop

    FimLeitura:

        ; Exibe o nome armazenado
        MOV AH, 9
        LEA DX, MsgExibir
        INT 21h

        ; Exibe os caracteres armazenados em "Nome"
        MOV CX, BX                         ; Define CX como o número de caracteres lidos
        XOR BX, BX                         ; Reinicializa o índice para começar do início do vetor
    ExibirLoop:
        MOV DL, Nome[BX]                   ; Carrega o caractere do vetor em DL
        MOV AH, 2                          ; Função para exibir um caractere
        INT 21h
        INC BX                             ; Próximo caractere
        LOOP ExibirLoop
        
    ; Exibe a mensagem de soma
    MOV AH, 9
    LEA DX, MsgSoma
    INT 21h

    ; Converte e exibe o valor de AX (soma dos valores ASCII) em formato decimal
    CALL AXParaDecimal

    ; Finaliza o programa
    MOV AH, 4Ch
    INT 21h
MAIN ENDP

; Procedimento para converter o valor de AX para decimal e exibir
AXParaDecimal PROC
    PUSH AX                             ; Salva o valor de AX na pilha
    XOR CX, CX                          ; Zera CX para armazenar os dígitos
    MOV BX, 10                          ; Define o divisor como 10
ConvLoop:
    XOR DX, DX                          ; Zera DX para divisão
    DIV BX                              ; Divide AX por 10, resultado em AX e resto em DX
    ADD DL, '0'                         ; Converte o dígito para ASCII
    PUSH DX                             ; Armazena o dígito na pilha
    INC CX                              ; Incrementa a contagem de dígitos
    CMP AX, 0
    JNE ConvLoop                        ; Continua até que AX seja 0

    ; Exibe os dígitos em ordem correta
ExibeLoop:
    POP DX                              ; Recupera o dígito
    MOV AH, 2                           ; Função para exibir um caractere
    MOV DL, DL                          ; Carrega o dígito em DL
    INT 21h
    LOOP ExibeLoop

    POP AX                              ; Restaura o valor original de AX
    RET
AXParaDecimal ENDP

END MAIN
