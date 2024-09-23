TITLE WHILE
.MODEL SMALL
.DATA
    ASTER DB "*$"
.STACK 100h
.CODE 
MAIN PROC 

    MOV AX,@DATA
    MOV DS,AX
    MOV CX,0 ;Inicializa CX COM 0

WHILE:
    ;Lê um caractere do teclado
    MOV AH,1
    INT 21h
    ;Compara o caracter lido com o valor do CR na tabela ASCII 
    CMP AL,13D
    JE ASTERISCO ;salto condicional equal
    INC CX ;soma 1 em CX
    JMP WHILE ;reinicia o loop
    

ASTERISCO:
    ;Exibe a string, que no caso é o "*"
    MOV AH,9
    MOV DX, OFFSET ASTER 
    INT 21h
    LOOP ASTERISCO ;realiza o loop CX vezes

    MOV AH,4Ch
    INT 21h

MAIN ENDP

END MAIN  