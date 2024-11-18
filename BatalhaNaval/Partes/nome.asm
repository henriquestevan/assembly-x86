TITLE LEITURA-NOME
.MODEL SMALL
.STACK 100h
.DATA
    Nome DB 10 DUP(?)          ; Declara um vetor de 10 bytes para armazenar o nome
    MsgLeitura DB 'Digite seu nome (ate 10 caracteres): $'  
    MsgExibir DB 10,13,'Nome armazenado: $' 

.CODE
MAIN PROC
    MOV AX, @DATA              
    MOV DS, AX

    MOV AH, 9
    LEA DX, MsgLeitura
    INT 21h

    ; Lê o nome e armazena em "Nome"
    MOV CX, 10                 ; Limita a leitura a 10 caracteres
    XOR BX, BX                 ; Usa BX como índice
LeituraLoop:
    MOV AH, 1                  ; Função para ler um caractere
    INT 21h
    CMP AL, 13                 ; Verifica se o usuário pressionou "Enter" (código ASCII 13)
    JE FimLeitura
    MOV Nome[BX], AL           ; Armazena o caractere no vetor
    INC BX                     ; Incrementa o índice
    LOOP LeituraLoop

FimLeitura:
    ; Exibe o nome armazenado
    MOV AH, 9
    LEA DX, MsgExibir
    INT 21h

    ; Exibe os caracteres armazenados em "Nome"
    MOV CX, BX                 ; Define CX como o número de caracteres lidos
    XOR BX, BX                 ; Reinicializa o índice para começar do início do vetor
ExibirLoop:
    MOV DL, Nome[BX]           ; Carrega o caractere do vetor em DL
    MOV AH, 2                  ; Função para exibir um caractere
    INT 21h
    INC BX                     ; Próximo caractere
    LOOP ExibirLoop

    ; Finaliza o programa
    MOV AH, 4Ch
    INT 21h
MAIN ENDP
END MAIN
