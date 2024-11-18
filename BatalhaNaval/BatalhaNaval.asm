TITLE BatalhaNaval
.MODEL SMALL
.STACK 100h

Print_Char MACRO VALOR_CHAR
    ;Macro para printar um caractere.
    MOV AH,2
    MOV DL,VALOR_CHAR
    INT 21h

ENDM

Save_Regs MACRO
    ;Macro para salvar todos os registradores.
    PUSH AX
    PUSH BX
    PUSH CX
    PUSH DX
    PUSH SI
    PUSH DI
    PUSH BP
    PUSHF
ENDM

Load_Regs MACRO
    ;Macro para carregar todos os registradores.
    POPF
    POP BP
    POP DI
    POP SI
    POP DX
    POP CX
    POP BX
    POP AX
ENDM

Sair_Jogo MACRO
    ;Macro para finalizar o programa
    MOV AH,4Ch
    INT 21h

ENDM

.DATA

    ;DI:BX, DI é o vetor coluna e BX o vetor linha.
    MATRIZINICIAL DB 10 DUP(176)
                  DB 10 DUP(177)
                  DB 10 DUP(176)
                  DB 10 DUP(177)
                  DB 10 DUP(176)
                  DB 10 DUP(177)
                  DB 10 DUP(176)
                  DB 10 DUP(177)
                  DB 10 DUP(176)
                  DB 10 DUP(177)

    MATRIZ1 DB 0,2,2,2,0,0,3,0,0,0         ; ░ █ █ █ ░ ░ █ ░ ░ ░
            DB 0,0,0,0,0,0,3,0,0,0         ; ░ ░ ░ ░ ░ ░ █ ░ ░ ░
            DB 0,0,0,1,0,0,3,0,0,0         ; ░ ░ ░ █ ░ ░ █ ░ ░ ░
            DB 0,0,0,1,0,0,3,0,0,0         ; ░ ░ ░ █ ░ ░ █ ░ ░ ░
            DB 0,0,0,0,0,0,0,0,0,0         ; ░ ░ ░ ░ ░ ░ ░ ░ ░ ░
            DB 0,4,0,0,0,0,0,0,0,0         ; ░ █ ░ ░ ░ ░ ░ ░ ░ ░
            DB 4,4,0,0,0,0,1,1,0,0         ; █ █ ░ ░ ░ ░ █ █ ░ ░
            DB 0,4,0,0,0,0,0,0,0,0         ; ░ █ ░ ░ ░ ░ ░ ░ ░ ░
            DB 0,0,0,0,0,4,0,0,0,0         ; ░ ░ ░ ░ ░ █ ░ ░ ░ ░
            DB 0,0,0,0,4,4,4,0,0,0         ; ░ ░ ░ ░ █ █ █ ░ ░ ░

    MATRIZ2 DB 4,4,4,0,0,0,4,0,0,0         ; █ █ █ ░ ░ ░ █ ░ ░ ░
            DB 0,4,0,0,0,4,4,4,0,0         ; ░ █ ░ ░ ░ █ █ █ ░ ░
            DB 0,0,0,0,0,0,0,0,0,0         ; ░ ░ ░ ░ ░ ░ ░ ░ ░ ░
            DB 0,0,0,1,0,0,0,0,0,0         ; ░ ░ ░ █ ░ ░ ░ ░ ░ ░
            DB 0,0,0,1,0,0,1,1,0,0         ; ░ ░ ░ █ ░ ░ █ █ ░ ░
            DB 0,0,0,0,0,0,0,0,0,0         ; ░ ░ ░ ░ ░ ░ ░ ░ ░ ░
            DB 0,0,0,3,0,0,0,0,0,0         ; ░ ░ ░ █ ░ ░ ░ ░ ░ ░
            DB 0,0,0,3,0,0,0,0,0,0         ; ░ ░ ░ █ ░ ░ ░ ░ ░ ░
            DB 0,0,0,3,0,0,2,2,2,0         ; ░ ░ ░ █ ░ ░ █ █ █ ░
            DB 0,0,0,3,0,0,0,0,0,0         ; ░ ░ ░ █ ░ ░ ░ ░ ░ ░

    MATRIZ3 DB 0,0,0,0,1,0,0,0,0,4         ; ░ ░ ░ ░ █ ░ ░ ░ ░ █
            DB 0,0,0,0,1,0,0,0,4,4         ; ░ ░ ░ ░ █ ░ ░ ░ █ █
            DB 0,0,0,0,0,0,0,0,0,4         ; ░ ░ ░ ░ ░ ░ ░ ░ ░ █
            DB 0,0,2,2,2,0,0,0,0,0         ; ░ ░ █ █ █ ░ ░ ░ ░ ░
            DB 0,0,0,0,0,0,0,0,0,0         ; ░ ░ ░ ░ ░ ░ ░ ░ ░ ░
            DB 0,0,0,0,0,0,0,0,0,0         ; ░ ░ ░ ░ ░ ░ ░ ░ ░ ░
            DB 3,3,3,3,0,0,4,0,0,0         ; █ █ █ █ ░ ░ █ ░ ░ ░
            DB 0,0,0,0,0,4,4,4,0,0         ; ░ ░ ░ ░ ░ █ █ █ ░ ░
            DB 0,1,0,0,0,0,0,0,0,0         ; ░ █ ░ ░ ░ ░ ░ ░ ░ ░
            DB 0,1,0,0,0,0,0,0,0,0         ; ░ █ ░ ░ ░ ░ ░ ░ ░ ░

    MATRIZ4 DB 1,1,0,0,0,0,0,0,0,0         ; █ █ ░ ░ ░ ░ ░ ░ ░ ░
            DB 0,0,0,0,0,3,0,0,0,0         ; ░ ░ ░ ░ ░ █ ░ ░ ░ ░
            DB 0,0,0,2,0,3,0,0,0,0         ; ░ ░ ░ █ ░ █ ░ ░ ░ ░
            DB 0,0,0,2,0,3,0,0,0,0         ; ░ ░ ░ █ ░ █ ░ ░ ░ ░
            DB 0,0,0,2,0,3,0,0,4,0         ; ░ ░ ░ █ ░ █ ░ ░ █ ░
            DB 0,0,0,0,0,0,0,0,4,4         ; ░ ░ ░ ░ ░ ░ ░ ░ █ █
            DB 0,0,0,0,0,0,0,0,4,0         ; ░ ░ ░ ░ ░ ░ ░ ░ █ ░
            DB 4,4,4,0,0,0,0,0,0,0         ; █ █ █ ░ ░ ░ ░ ░ ░ ░
            DB 0,4,0,0,0,0,0,0,0,0         ; ░ █ ░ ░ ░ ░ ░ ░ ░ ░
            DB 0,0,0,0,1,1,0,0,0,0         ; ░ ░ ░ ░ █ █ ░ ░ ░ ░

    MATRIZ5 DB 0,1,0,0,0,0,2,2,2,0         ; ░ █ ░ ░ ░ ░ █ █ █ ░
            DB 0,1,0,0,0,0,0,0,0,0         ; ░ █ ░ ░ ░ ░ ░ ░ ░ ░
            DB 0,0,0,0,0,0,0,0,0,0         ; ░ ░ ░ ░ ░ ░ ░ ░ ░ ░
            DB 3,0,0,0,0,0,0,0,0,0         ; █ ░ ░ ░ ░ ░ ░ ░ ░ ░
            DB 3,0,0,0,0,0,0,0,4,0         ; █ ░ ░ ░ ░ ░ ░ ░ █ ░
            DB 3,0,0,0,0,0,0,4,4,4         ; █ ░ ░ ░ ░ ░ ░ █ █ █
            DB 3,0,0,4,0,0,0,0,0,0         ; █ ░ ░ █ ░ ░ ░ ░ ░ ░
            DB 0,0,4,4,4,0,0,0,1,1         ; ░ ░ █ █ █ ░ ░ ░ █ █
            DB 0,0,0,0,0,0,0,0,0,0         ; ░ ░ ░ ░ ░ ░ ░ ░ ░ ░
            DB 0,0,0,0,0,0,0,0,0,0         ; ░ ░ ░ ░ ░ ░ ░ ░ ░ ░

    MATRIZ6 DB 0,0,0,0,1,1,0,0,0,0         ; ░ ░ ░ ░ █ █ ░ ░ ░ ░
            DB 0,0,0,0,0,0,0,0,3,0         ; ░ ░ ░ ░ ░ ░ ░ ░ █ ░
            DB 0,0,0,0,0,0,0,0,3,0         ; ░ ░ ░ ░ ░ ░ ░ ░ █ ░
            DB 0,0,2,2,2,0,0,0,3,0         ; ░ ░ █ █ █ ░ ░ ░ █ ░
            DB 0,0,0,0,0,0,0,0,3,0         ; ░ ░ ░ ░ ░ ░ ░ ░ █ ░
            DB 0,0,0,0,0,0,0,0,0,0         ; ░ ░ ░ ░ ░ ░ ░ ░ ░ ░
            DB 0,0,0,0,4,0,0,0,0,0         ; ░ ░ ░ ░ █ ░ ░ ░ ░ ░
            DB 0,0,0,4,4,4,0,0,0,4         ; ░ ░ ░ █ █ █ ░ ░ ░ █
            DB 1,1,0,0,0,0,0,0,4,4         ; █ █ ░ ░ ░ ░ ░ ░ █ █
            DB 0,0,0,0,0,0,0,0,0,4         ; ░ ░ ░ ░ ░ ░ ░ ░ ░ █

    MATRIZ7 DB 0,0,0,0,1,0,0,0,0,0         ; ░ ░ ░ ░ █ ░ ░ ░ ░ ░
            DB 0,0,0,0,1,0,0,0,0,4         ; ░ ░ ░ ░ █ ░ ░ ░ ░ █
            DB 0,0,0,0,0,0,0,0,4,4         ; ░ ░ ░ ░ ░ ░ ░ ░ █ █
            DB 0,0,0,0,2,2,2,0,0,4         ; ░ ░ ░ ░ █ █ █ ░ ░ █
            DB 3,0,0,0,0,0,0,0,0,0         ; █ ░ ░ ░ ░ ░ ░ ░ ░ ░
            DB 3,0,0,0,0,0,0,0,0,0         ; █ ░ ░ ░ ░ ░ ░ ░ ░ ░
            DB 3,0,0,0,0,0,0,4,0,0         ; █ ░ ░ ░ ░ ░ ░ █ ░ ░
            DB 3,0,0,1,0,0,4,4,4,0         ; █ ░ ░ █ ░ ░ █ █ █ ░
            DB 0,0,0,1,0,0,0,0,0,0         ; ░ ░ ░ █ ░ ░ ░ ░ ░ ░
            DB 0,0,0,0,0,0,0,0,0,0         ; ░ ░ ░ ░ ░ ░ ░ ░ ░ ░

    MATRIZ8 DB 0,0,0,0,0,0,0,0,0,0         ; ░ ░ ░ ░ ░ ░ ░ ░ ░ ░
            DB 1,1,0,0,0,0,0,0,0,0         ; █ █ ░ ░ ░ ░ ░ ░ ░ ░
            DB 0,0,0,0,2,2,2,0,0,0         ; ░ ░ ░ ░ █ █ █ ░ ░ ░
            DB 0,0,0,0,0,0,0,0,0,0         ; ░ ░ ░ ░ ░ ░ ░ ░ ░ ░
            DB 4,0,0,3,3,3,3,0,0,0         ; █ ░ ░ █ █ █ █ ░ ░ ░
            DB 4,4,0,0,0,0,0,0,0,0         ; █ █ ░ ░ ░ ░ ░ ░ ░ ░
            DB 4,0,0,0,0,0,0,0,0,0         ; █ ░ ░ ░ ░ ░ ░ ░ ░ ░
            DB 0,0,0,0,0,1,1,0,0,0         ; ░ ░ ░ ░ ░ █ █ ░ ░ ░
            DB 0,4,0,0,0,0,0,0,0,0         ; ░ █ ░ ░ ░ ░ ░ ░ ░ ░
            DB 4,4,4,0,0,0,0,0,0,0         ; █ █ █ ░ ░ ░ ░ ░ ░ ░

    MATRIZ9 DB 0,0,0,0,0,0,0,1,1,0         ; ░ ░ ░ ░ ░ ░ ░ █ █ ░
            DB 0,1,0,0,0,0,0,0,0,0         ; ░ █ ░ ░ ░ ░ ░ ░ ░ ░
            DB 0,1,0,0,0,0,0,0,2,0         ; ░ █ ░ ░ ░ ░ ░ ░ █ ░
            DB 0,0,0,0,0,0,0,0,2,0         ; ░ ░ ░ ░ ░ ░ ░ ░ █ ░
            DB 0,3,0,0,0,0,0,0,2,0         ; ░ █ ░ ░ ░ ░ ░ ░ █ ░
            DB 0,3,0,0,0,0,4,0,0,0         ; ░ █ ░ ░ ░ ░ █ ░ ░ ░
            DB 0,3,0,0,0,4,4,4,0,0         ; ░ █ ░ ░ ░ █ █ █ ░ ░
            DB 0,3,0,4,0,0,0,0,0,0         ; ░ █ ░ █ ░ ░ ░ ░ ░ ░
            DB 0,0,0,4,4,0,0,0,0,0         ; ░ ░ ░ █ █ ░ ░ ░ ░ ░
            DB 0,0,0,4,0,0,0,0,0,0         ; ░ ░ ░ █ ░ ░ ░ ░ ░ ░

    MATRIZ10 DB 0,0,0,0,0,0,0,0,1,1        ; ░ ░ ░ ░ ░ ░ ░ ░ █ █
             DB 0,0,0,1,0,0,0,0,0,0        ; ░ ░ ░ █ ░ ░ ░ ░ ░ ░
             DB 0,0,0,1,0,3,0,0,2,0        ; ░ ░ ░ █ ░ █ ░ ░ █ ░
             DB 0,0,0,0,0,3,0,0,2,0        ; ░ ░ ░ ░ ░ █ ░ ░ █ ░
             DB 0,0,0,0,0,3,0,0,2,0        ; ░ ░ ░ ░ ░ █ ░ ░ █ ░
             DB 0,4,0,0,0,3,0,0,0,0        ; ░ █ ░ ░ ░ █ ░ ░ ░ ░
             DB 4,4,0,0,0,0,0,0,0,0        ; █ █ ░ ░ ░ ░ ░ ░ ░ ░
             DB 0,4,0,0,0,0,0,0,0,0        ; ░ █ ░ ░ ░ ░ ░ ░ ░ ░
             DB 0,0,0,0,4,4,4,0,0,0        ; ░ ░ ░ ░ █ █ █ ░ ░ ░
             DB 0,0,0,0,0,4,0,0,0,0        ; ░ ░ ░ ░ ░ █ ░ ░ ░ ░

    ;As strings a seguir são utilizadas na interface do jogo.
    LOCAL_NUMR DB "*     0   1   2   3   4   5   6   7   8   9      INFOS    *$"
    CNTD_LETRAS DB 65
    MSG_DIGI DB 10,"Digite a posicao desejada (Ex: A1): $"

    ;Aqui é a tela inicial do jogo, com o menu de opções.
    TELA_INICIAL_2 DB 10,13, "*",57 DUP(32),"*$"
    TELA_INICIAL_3 DB 10,13, "*   ",219,223,220," ",220,223,220," ",223,219,223," ",220,223,220," ",219,"   ",219," ",219," ",220,223,220,"                           *$"
    TELA_INICIAL_4 DB 10,13, "*   ",219,223,219," ",219,223,219,"  ",219,"  ",219,223,219," ",219,"   ",219,223,219," ",219,223,219,"                           *$"
    TELA_INICIAL_5 DB 10,13, "*   ",223,223,"  ",223," ",223,"  ",223,"  ",223," ",223," ",223,223,223," ",223," ",223," ",223," ",223,"                           *$"
    TELA_INICIAL_7 DB 10,13, "*   ",219,"  ",219," ",220,223,220," ",219,"   ",219," ",220,223,220," ",219,"                                  *$"
    TELA_INICIAL_8 DB 10,13, "*   ",219,"",223,"",220,"",219," ",219,"",223,"",219,"  ",219," ",219,"  ",219,223,219," ",219,"                     JOGAR        *$"
    TELA_INICIAL_9 DB 10,13, "*   ",223,"  ",223," ",223," ",223,"   ",223,"   ",223," ",223," ",223,223,223,"                                *$"
    TELA_INICIAL_9_ DB 10,13,"*                                   TUTORIAL              *$"
    TELA_INICIAL_10 DB 10,13,"*            ",124,"   ",124,"   ",124,"                       CREDITOS     *$"
    TELA_INICIAL_11 DB 10,13,"*           ",41,95,41," ",41,95,41," ",41,95,41,"                                   *$"
    TELA_INICIAL_12 DB 10,13,"*         ",41,95,95,95,41,"",41,95,95,95,41,"",41,95,95,95,41,"",92,"                                *$"
    TELA_INICIAL_13 DB 10,13,"*        ",41,95,95,95,95,95,41,95,95,95,95,41,95,95,95,95,41,92,92,"                              *$"
    TELA_INICIAL_14 DB 10,13,"*       ",95,95,95,95,124,95,95,95,95,124,95,95,95,95,124,95,95,95,95,92,92,92,95,95,"                          *$"
    TELA_INICIAL_15 DB 10,13,"*",7 DUP(45),92,"                 ",47,31 DUP(45),"*$"
    TELA_INICIAL_16 DB 10,13,"* ~~~   ~~~~~~~~~~~~~~~~~~~      ~~~~       ~",201,205,205,205,205,205,205,205,205,205,205,187,"~*$"
    TELA_INICIAL_17 DB 10,13,"*      ~~~     ~~     ~~      ~~~~~     ~~   ",186,"  PRESS.  ",186," *$"
    TELA_INICIAL_18 DB 10,13,"*  ~~     ~~      ~~~      ~~    ~~~       ~~",186,"'U' para ",24,186," *$"
    TELA_INICIAL_19 DB 10,13,"*    ~~     ~~   ~~~   ~    ~~     ~~~   ~~  ",186,"'J' para ",25,186,"~*$"
    TELA_INICIAL_20 DB 10,13,"*      ~~~     ~~     ~~      ~~~~~     ~~   ",200,205,205,205,205,205,205,205,205,205,205,188," *$"
    TELA_INICIAL_JOGAR DB 10,13, "*   ",219,"",223,"",220,"",219," ",219,"",223,"",219,"  ",219," ",219,"  ",219,223,219," ",219,"                    ",16," JOGAR       *$"
    TELA_INICIAL_TUTORIAL DB 10,13,"*                                 ",16," TUTORIAL              *$"
    TELA_INICIAL_CREDITOS DB 10,13,"*            ",124,"   ",124,"   ",124,"                      ",16," CREDITOS    *$"

    ;Vetores que armazenam as palavras colocadas na primeira tela.
    Nome DB 10 DUP(32)
    Palavra DB 11 DUP(32)

    ;Interface da primeira tela que aparece.
    TELA_INICIAL DB 13,10, "***********************************************************$"
    ONDAS1 DB 10,13,"*~~~      ~       ~~~       ~    ~~~~~~        ~~~~      ~*",10,13,"*    ~~~      ~~~~    ~~~     ~~~      ~~~      ~~     ~~ *$"
    ONDAS2 DB 10,13,"*~~    ~~~    ~    ~~~~    ~~~    ~~    ~~~    ~~  ~~    ~*$"
    ONDAS3 DB 10,13,"*   ~~   ~~~~     ~    ~~~~    ~~     ~~    ~~~     ~~    *",10,13,"*~~     ~    ~~   ~~    ~   ~    ~~~~    ~     ~~~    ~~~ *$"
    ONDAS_NOME DB 13,10,"*  ~~~~    ~~~  Digite seu nome de usuario: ~   ~~~     ~~*$"
    ONDAS_PENSA DB 13,10,"* ~  ~~ ~  Digite a primeira palavra que pensar: ~~~~    ~*$"
    ONDAS_ENTER DB 13,10,"* ~~~~   ~  ~~ ",16," Aperte ENTER para enviar.    ~~~  ~~~   ~*$"
    PARTE_BAIXO DB 13,10,'*',' ~~~  ~~   ~    ~~~ ~', 200,12 DUP(205),188, ' ~~   ~~~  ~~    ~~~  ', '*', "$"
    PARTE_MEIO DB 13,10,'*','~~ ~  ~  ~    ~~   ~ ', 186,32,"$"
    PARTE_MEIO2 DB 32,186,'~~~    ~  ~~ ~  ~~~   ', '*', "$"
    PARTE_CIMA DB 13,10,'*',' ~~   ~~~            ', 201,12 DUP(205),187, '              ~~  ~~~ ', '*', "$"

    ;Onde será armazenado o valor aleatório no procedimento.
    ALEATORIO DW ?
    ;Para saber se o usuário terminou de digitar, para exibir a mensagem falando para apertar ENTER para continuar.
    USUARIO_TERMINOU DB 0

    ;Interface da tela dos créditos.
    LINHA_AST DB "***********************************************************$"
    LINHA_AST2 DB 10,13,"***********************************************************",10,"$"
    TELA_INICIAL2 DB 13,10,"*                                                         *$"
    TELA_INICIAL3 DB 13,10,"*                      BATALHA NAVAL                      *$"
    TELA_INICIAL4 DB 13,10,"*                        FEITO POR:                       *$"
    TELA_INICIAL5 DB 13,10,"*                      PEDRO CARDOSO                      *$"
    TELA_INICIAL6 DB 13,10,"*                        JOAO PEDRO                       *$"
    TELA_INICIAL7 DB 13,10,"*                     HENRIQUE ESTEVAN                    *$"
    TELA_INICIAL8 DB 13,10,"*              ",16," Pressione ENTER para voltar.             *$"
    TELA_INICIAL9 DB 13,10,"*                      @  2024 PUCC                       *$"

    ;Interface da tela de como jogar.
    TELA_REGRA_2  DB 10,13,"*     ___                                                 *$"
    TELA_REGRA_3  DB 10,13,"*    / __\  ___   _ __ ___    ___       EMBARCACOES:      *$"
    TELA_REGRA_4  DB 10,13,"*   / /    / _ \ | '_ ` _ \  / _ \                        *$"
    TELA_REGRA_5  DB 10,13,"*  / /___ | (_) || | | | | || (_) |    ",5,"  HIDRO-AVIAO     *$"
    TELA_REGRA_6  DB 10,13,"*  \____/  \___/ |_| |_| |_| \___/                        *$"
    TELA_REGRA_7  DB 10,13,"*    __                                ",3,"  ENCOURACADO     *$"
    TELA_REGRA_8  DB 10,13,"*    \ \   ___    __ _   __ _  _ __                       *$"
    TELA_REGRA_9  DB 10,13,"*     \ \ / _ \  / _` | / _` || `__|   ",6,"  FRAGATA         *$"
    TELA_REGRA_10 DB 10,13,"*  /\_/ /| (_) || (_| || (_| || |                         *$"
    TELA_REGRA_11 DB 10,13,"*  \___/  \___/  \__, | \__,_||_|      ",4,"  SUBMARINO       *$"
    TELA_REGRA_12 DB 10,13,"*                |___/                                    *$"
    TELA_REGRA_14 DB 10,13,"* ",250," Objetivo: Afundar todas as embarcacoes do oponente.   *$"
    TELA_REGRA_16 DB 10,13,"* ",250," Digite a linha (A-J) e a coluna (0-9) para atirar.    *$"
    TELA_REGRA_18 DB 10,13,"* ",250," Ao apertar 'ESC' o jogo sera finalizado.              *$"
    TELA_REGRA_19 DB 10,13,"*            _______                                      *$"
    TELA_REGRA_20 DB 10,13,"*           | ENTER |                                     *$"
    TELA_REGRA_21 DB 10,13,"*           |__     | para voltar ao menu inicial         *$"
    TELA_REGRA_22 DB 10,13,"*              |    |                                     *$"
    TELA_REGRA_23 DB 10,13,"*              |____|                                     *$"

    ;Interface da tela de vitoria.
    TELA_VENCEU_3 DB 10,13,  "*    _    __   ______   _   __  ______   ______  __  _    *$"
    TELA_VENCEU_4 DB 10,13,  "*   | |  / /  / ____/  / | / / / ____/  / ____/ / / / /   *$"
    TELA_VENCEU_5 DB 10,13,  "*   | | / /  / __/    /  |/ / / /      / __/   / / / /    *$"
    TELA_VENCEU_6 DB 10,13,  "*   | |/ /  / /___   / /|  / / /___   / /___  / /_/ /     *$"
    TELA_VENCEU_7 DB 10,13,  "*   |___/  /_____/  /_/ |_/  \____/  /_____/  \____/      *$"
    TELA_VENCEU_9 DB 10,13,  "*                       ___________                       *$"
    TELA_VENCEU_10 DB 10,13, "*                      '._==_==_=_.'                      *$"
    TELA_VENCEU_11 DB 10,13, "*                     .-\:        /-.                     *$"
    TELA_VENCEU_12 DB 10,13, "*                    | (|:.       |) |                    *$"
    TELA_VENCEU_13 DB 10,13, "*                      -|:.       |-'                     *$"
    TELA_VENCEU_13_ DB 10,13,"*                       |:.       |                       *$"
    TELA_VENCEU_14 DB 10,13, "*                        \::.    /                        *$"
    TELA_VENCEU_15 DB 10,13, "*                         '::. .'                         *$"
    TELA_VENCEU_16 DB 10,13, "*                           ) (                           *$"
    TELA_VENCEU_17 DB 10,13, "*                         _.' '._                         *$"
    TELA_VENCEU_18 DB 10,13, "*                        `'''''''`                        *$"
    TELA_VENCEU_20 DB 10,13, "*                     JOGAR NOVAMENTE                     *$"
    TELA_VENCEU_21 DB 10,13, "*                          MENU                           *$"
    TELA_VENCEU_22 DB 10,13, "*                          SAIR                           *$"
    TELA_VENCEU_JOGAR DB 10,13, "*                   ",16," JOGAR NOVAMENTE                     *$"
    TELA_VENCEU_MENU DB 10,13, "*                        ",16," MENU                           *$"
    TELA_VENCEU_SAIR DB 10,13, "*                        ",16," SAIR                           *$"

    ;Interface para os scores.
    LINHA_219_NORMAL DB '*',32,32,32,41 DUP(219),13 DUP(32),'*',10,"$"
    LINHA_219_OURN DB '*',32,32,32,41 DUP(219),32,32,32,32,32,"$"
    LINHA_219_ESP DB '*',32,32,32,41 DUP(219),"$"
    LINHA_219_COPN DB '*',32,32,32,41 DUP(219),32,32,32,32,32,"$"
    LINHA_219_ZAP DB '*',32,32,32,41 DUP(219),"$"

    QNT_OUROS_ABAT_PARC DB ?
    QNT_ESPADAS_ABAT_PARC DB ?
    QNT_COPAS_ABAT_PARC DB ?
    QNT_ZAP_ABAT_PARC DB ?

    QNT_OUROS_ABAT DB 48
    QNT_ESPADAS_ABAT DB 48
    QNT_COPAS_ABAT DB 48
    QNT_ZAP_ABAT DB 48

    QNT_ABAT_TOTAL DB ?

    CNT_OUROS DB "  Submarino  *$"
    CNT_OUROS_NUM DB "/2     *",10,"$"
    CNT_ESPADAS DB "   Fragata   *",10,"$"
    CNT_ESPADAS_NUM DB "/1$"
    CNT_COPAS DB " Encouracado *$"
    CNT_COPAS_NUM DB "/1     *",10,"$"
    CNT_ZAP DB " Hidroavioes *",10,"$"
    CNT_ZAP_NUM DB "/2$"
    CNT_NUM_SPC DB 32,32,32,32,32,"$"

    ;Onde armazena o endereço da matriz SI.
    COMECO_MATRIZ_SI DW ?

.CODE
MAIN PROC

    MOV AX,@DATA
    MOV DS,AX
    MOV ES,AX

    ;Já carrega a matriz inicial em DI.
    LEA DI,MATRIZINICIAL

    ;Será utilizado na tela do usuario.
    XOR BX,BX

    ;Chama a tela de usuario.
    CALL TELA_USUARIO_PROC

MENU:

    ;Chama a tela inicial, a de menu.
    CALL TELA_INICIAL_PROC

SELECAO_FASE_2VEZ:

    ;Faz a seleção da matriz que sera usada na partida.
    CALL SELECAO_FASE

    ;Salva o valor do endereço da matriz sorteada, ele é modificado varias
    ;vezes no programa, entao está em uma variavel.
    MOV COMECO_MATRIZ_SI,SI

    ;Chama a interface do jogo.
    CALL INTERFACE

INICIO_JOGO:

    ;Carrega o endereço da matriz caso tenha perdido.
    MOV SI,COMECO_MATRIZ_SI

    ;Chama o procedimento que le o que a posição que o usuario digitou.
    CALL SELECIONAR_POSICAO  ;Ao chamar esse procedimento, a linha estará em BH (Já convertida em linha) e a coluna em BL.

    ;Transforma os valores pegos no SELECIONAR_POSICAO em valores uteis para a
    ;manipulação da matriz.
    CALL PASSAR_PARAMETROS

    ;Compara a matriz sorteada com a que está sendo exibida na tela.
    CALL COMP_MATRIZ

    CALL INTERFACE

    ;Checa se o usuario acertou todos os 6 barcos.
    CMP QNT_ABAT_TOTAL,6
    JNE INICIO_JOGO

    ;Vai para a tela de que venceu a partida.
    CALL TELA_VENCEU_PROC
    ;Vê o que foi selecionado no menu do fim de partida.
    CMP DX,1
    JE MENU
    CMP DX,2
    JE FIM_DO_JOGO

    ;Zera todas as variaveis e a matriz para poderem ser usadas na próxima partida.
    LEA DI,MATRIZINICIAL
    CALL ZERAR_TUDO
    JMP SELECAO_FASE_2VEZ

FIM_DO_JOGO:

    Sair_Jogo

MAIN ENDP


TELA_CREDITOS_PROC PROC

    MOV AH,9
    ;Interface da tela de créditos.
    LEA DX,TELA_INICIAL
    INT 21h

    LEA DX,TELA_INICIAL2
    INT 21h
    INT 21h
    INT 21h
    INT 21h

    LEA DX,TELA_INICIAL3
    INT 21h

    LEA DX,TELA_INICIAL2
    INT 21h
    INT 21h

    LEA DX,TELA_INICIAL4
    INT 21h

    LEA DX,TELA_INICIAL5
    INT 21h

    LEA DX,TELA_INICIAL6
    INT 21h

    LEA DX,TELA_INICIAL7
    INT 21h

    LEA DX,TELA_INICIAL2
    INT 21h
    INT 21h
    INT 21h

    LEA DX,TELA_INICIAL8
    INT 21h

    LEA DX,TELA_INICIAL2
    INT 21h
    INT 21h
    INT 21h

    LEA DX,TELA_INICIAL9
    INT 21h

    LEA DX,TELA_INICIAL2
    INT 21h
    INT 21H
    INT 21h

    LEA DX,TELA_INICIAL
    INT 21h

    Print_Char 10

    ;Para o usuario sair quando quiser.
    MOV AH,8
    INT 21h

    ;Vê se a pessoa apertou ESC.
    CMP AL,27
    JE PRESS_ESC_CREDITOS

    RET

    PRESS_ESC_CREDITOS:

    Sair_Jogo

TELA_CREDITOS_PROC ENDP

TELA_INICIAL_PROC PROC

    ;Inicialização de BX para que possa ser usado na escolha da opção desejada.
    XOR BX,BX

    ;Print da tela de inicio.
    ESCOLHAS_INICIO:

    MOV AH, 9
    LEA DX, TELA_INICIAL
    INT 21h

    LEA DX, TELA_INICIAL_2
    INT 21h
    int 21h

    LEA DX, TELA_INICIAL_3
    INT 21h

    LEA DX, TELA_INICIAL_4
    INT 21h

    LEA DX, TELA_INICIAL_5
    INT 21h

    LEA DX, TELA_INICIAL_2
    INT 21h

    LEA DX, TELA_INICIAL_7
    INT 21h

    ;Checa onde o ponteiro da tela inicial estava, se estiver em 0
    ;é o botao de jogar, em 1 o de tutorial, e o 2 dos créditos.

    ;Se o ponteiro deveria estar la, a string que seria exibida no lugar da opção é trocada por outra
    ;igual mas com a adição do ponteiro.
    CMP BL,0
    JNE ESCOLHAS_1
    LEA DX, TELA_INICIAL_JOGAR
    INT 21H
    JMP ESCOLHAS_1_
    ESCOLHAS_1:
    LEA DX, TELA_INICIAL_8
    INT 21H
    ESCOLHAS_1_:

    LEA DX, TELA_INICIAL_9
    INT 21H

    CMP BL,1
    JNE ESCOLHAS_2
    LEA DX, TELA_INICIAL_TUTORIAL
    INT 21H
    JMP ESCOLHAS_2_
    ESCOLHAS_2:
    LEA DX, TELA_INICIAL_9_
    INT 21H
    ESCOLHAS_2_:

    LEA DX, TELA_INICIAL_2
    INT 21H

    CMP BL,2
    JNE ESCOLHAS_3
    LEA DX, TELA_INICIAL_CREDITOS
    INT 21H
    JMP ESCOLHAS_3_
    ESCOLHAS_3:
    LEA DX, TELA_INICIAL_10
    INT 21H
    ESCOLHAS_3_:

    ;Continua a printar a parte estática da interface.
    LEA DX, TELA_INICIAL_11
    INT 21h

    LEA DX, TELA_INICIAL_12
    INT 21h

    LEA DX, TELA_INICIAL_13
    INT 21h

    LEA DX, TELA_INICIAL_14
    INT 21h

    LEA DX, TELA_INICIAL_15
    INT 21h

    LEA DX, TELA_INICIAL_16
    INT 21h

    LEA DX, TELA_INICIAL_17
    INT 21h

    LEA DX, TELA_INICIAL_18
    INT 21h

    LEA DX, TELA_INICIAL_19
    INT 21h

    LEA DX, TELA_INICIAL_20
    INT 21h

    LEA DX, LINHA_AST2
    INT 21h

    ;Vê se o usuario ira ir para cima com o ponteiro, apertando a tecla "U", ou
    ;se vai para baixo com a tecla "J".
    MOV AH,8
    INT 21H
    CMP AL,'U'
    JE ESCOLHAS_U
    CMP AL,'u'
    JE ESCOLHAS_U

    CMP AL,'j'
    JE ESCOLHAS_J
    CMP AL,'J'
    JE ESCOLHAS_J

    ;Ou se o usuario escolheu a opção desejada com ENTER.
    CMP AL,13
    JE ESCOLHAS_FIM

    ;Vê se a pessoa apertou ESC.
    CMP AL,27
    JE PRESS_ESC_INICIAL

    ;Se ele apertou U, é decrementado 1 de BX, fazendo o ponteiro subir para a opção anterior.
    ESCOLHAS_U:
    DEC BL
    JMP ESCOLHAS_INICIO
    ;O mesmo serve para o J, onde BX é incrementado.
    ESCOLHAS_J:
    INC BL
    JMP ESCOLHAS_INICIO

    ;Checa o que o usuario havia selecionado antes do ENTER.
    ESCOLHAS_FIM:
    CMP BL,1
    JE ESCOLHAS_TUTORIAL
    CMP BL,2
    JE ESCOLHAS_CREDITOS 
    RET

    ;E aqui define para qual procedimento será chamado.
    ESCOLHAS_TUTORIAL:
    CALL TELA_TUTORIAL_PROC
    JMP ESCOLHAS_INICIO
    ESCOLHAS_CREDITOS:
    CALL TELA_CREDITOS_PROC
    JMP ESCOLHAS_INICIO

    PRESS_ESC_INICIAL:

    Sair_Jogo

TELA_INICIAL_PROC ENDP

TELA_TUTORIAL_PROC PROC

    ;Interface da tela de como jogar.
    MOV AH,9
    LEA DX,LINHA_AST
    INT 21H

    LEA DX,TELA_REGRA_2
    INT 21H

    LEA DX,TELA_REGRA_3
    INT 21H

    LEA DX,TELA_REGRA_4
    INT 21H

    LEA DX,TELA_REGRA_5
    INT 21H

    LEA DX,TELA_REGRA_6
    INT 21H

    LEA DX,TELA_REGRA_7
    INT 21H

    LEA DX,TELA_REGRA_8
    INT 21H

    LEA DX,TELA_REGRA_9
    INT 21H

    LEA DX,TELA_REGRA_10
    INT 21H

    LEA DX,TELA_REGRA_11
    INT 21H

    LEA DX,TELA_REGRA_12
    INT 21H

    LEA DX,TELA_INICIAL2
    INT 21H

    LEA DX,TELA_REGRA_14
    INT 21H

    LEA DX,TELA_INICIAL2
    INT 21H

    LEA DX,TELA_REGRA_16
    INT 21H

    LEA DX,TELA_INICIAL2
    INT 21H

    LEA DX,TELA_REGRA_18
    INT 21H

    LEA DX,TELA_REGRA_19
    INT 21H

    LEA DX,TELA_REGRA_20
    INT 21H

    LEA DX,TELA_REGRA_21
    INT 21H

    LEA DX,TELA_REGRA_22
    INT 21H

    LEA DX,TELA_REGRA_23
    INT 21H

    LEA DX,LINHA_AST2
    INT 21H

    ;Quando a pessoa apertar qualquer tecla voltara para o menu.
    MOV AH,8
    INT 21H

    ;Vê se a pessoa apertou ESC.
    CMP AL,27
    JE PRESS_ESC_TUTORIAL

    RET

    PRESS_ESC_TUTORIAL:

    Sair_Jogo

TELA_TUTORIAL_PROC ENDP

SELECIONAR_POSICAO PROC

        MOV AH,9
        LEA DX,MSG_DIGI
        INT 21h
    
        ;BL tem o numero, ou seja, a coluna. E BH tem a linha, a letra.
        ;Lê um caractere do teclado
        MOV AH,01h
        INT 21h        

        ;Verifica se o caractere está entre "A" e "Z" ou "a" e "z"
        ;Para maiúsculo
        CMP AL, 'A'
        JB  SELECIONAR_POSICAO_MID
        CMP AL, 'Z'
        JA  SELECIONAR_POSICAO_MID

        ;Converte a letra maiúscula para seu valor numérico
        SUB AL, 'A'      ;"A" vira 0, "B" vira 1 e etc...
        MOV BH, AL
        JMP SELECIONAR_POSICAO_FIM

    SELECIONAR_POSICAO_MID:
        ;Para minúsculo
        CMP AL, 'a'
        JB  SELECIONAR_POSICAO_FIM
        CMP AL, 'z'
        JA  SELECIONAR_POSICAO_FIM
        
        ;Checa se foi apertado o ESC para sair.
        CMP AL,27
        JE PRESS_ESC_SELECIONAR

        ;Converte a letra minúscula para seu valor numérico
        SUB AL, 'a'      ;"a" vira 0, "b" vira 1 e etc...
        MOV BH, AL

    SELECIONAR_POSICAO_FIM:

        ;Pega o caractere numerico, da coluna.
        INT 21h
        MOV BL,AL
        ;Ajuda a tornar o numero da matriz da próxima rodada aleatório, baseando-se em
        ;quantas jogadas foram feitas na ultima partida.
        INC ALEATORIO
        ;Move para BL e transforma em valor.
        AND BL,0Fh
        ;Converte o valor da linha para que possa ser usado na matriz.
        CALL CONV_LINHA_LET

        ;No final temos linha em BH e coluna em BL.
        RET

    PRESS_ESC_SELECIONAR:

        Sair_Jogo

SELECIONAR_POSICAO ENDP

CONV_LINHA_LET PROC
    ;Onde ocorre a conversão das linhas para que sejam adicionadas aos indices, assim trocando de linha.
    ;Exceto se for a primeira (0).
    CMP BH,0
    JE CONV_LINHA_FIM
    ;Multiplica o valor obtido pela letra (A - 0, B - 1 e etc) por 10.
    MOV AL,10
    MUL BH
    MOV BH,AL

CONV_LINHA_FIM:

    RET

CONV_LINHA_LET ENDP

SELECAO_FASE PROC

    ;Pega o valor aleatório gerado antes, e faz com que se torne de 0 a 9.
    XOR DX,DX
    MOV AX,ALEATORIO
    ;Dividindo o valor por 10, e usando o ultimo digito para selecionar a matriz que será jogada.
    MOV BX,10
    DIV BX

    ;DL tem o resto da divisão.    
    CMP DL,0
    JE SELECAO_MATRIZ1
    CMP DL,1
    JE SELECAO_MATRIZ2
    CMP DL,2
    JE SELECAO_MATRIZ3
    CMP DL,3
    JE SELECAO_MATRIZ4
    CMP DL,4
    JE SELECAO_MATRIZ5
    CMP DL,5
    JE SELECAO_MATRIZ6
    CMP DL,6
    JE SELECAO_MATRIZ7
    CMP DL,7
    JE SELECAO_MATRIZ8
    CMP DL,8
    JE SELECAO_MATRIZ9
    CMP DL,9
    JE SELECAO_MATRIZ10

    ;Dependendo de qual numero foi selecionado, uma matriz diferente é armazenada em SI.
SELECAO_MATRIZ1:

    LEA SI,MATRIZ1
    RET

SELECAO_MATRIZ2:

    LEA SI,MATRIZ2
    RET

SELECAO_MATRIZ3:

    LEA SI,MATRIZ3
    RET

SELECAO_MATRIZ4:

    LEA SI,MATRIZ4
    RET

SELECAO_MATRIZ5:

    LEA SI,MATRIZ5
    RET

SELECAO_MATRIZ6:

    LEA SI,MATRIZ6
    RET

SELECAO_MATRIZ7:

    LEA SI,MATRIZ7
    RET

SELECAO_MATRIZ8:

    LEA SI,MATRIZ8
    RET

SELECAO_MATRIZ9:

    LEA SI,MATRIZ9
    RET

SELECAO_MATRIZ10:

    LEA SI,MATRIZ10
    RET

SELECAO_FASE ENDP

INTERFACE PROC

    ;Salva todos os registradores, pois esse proc altera muitos deles.
    Save_Regs

    ;Para saber se o ponteiro de DI esta apontando para o lugar certo. Se não for, ignora o JUMP.
    CMP DI,0
    JE INTERFACE_INICIO

    LEA DI,MATRIZINICIAL

INTERFACE_INICIO:

    ;Inicialização de BX, e inicio do print da interface.
    XOR BX,BX
    MOV AH,9
    LEA DX,TELA_INICIAL
    INT 21h
    Print_Char 10

    ;Printa os numeros que ficam acima do tabuleiro.
    MOV AH,9
    LEA DX,LOCAL_NUMR
    INT 21h

    Print_Char 10

    ;Chama o procedimento que printa as linhas que estariam vazias entre os espaços.
    CALL PRINTAR_LINHA

    ;Faz com que o loop rode 10 vezes, pois sao 10 espaços.
    MOV CX,10    

LOOP_PRINT_LET:

    ;Faz o print das letras que identificam cada linha.
    Print_Char '*'
    Print_Char 32
    CALL PRINTAR_LETRAS
    Print_Char 32
    Print_Char 219

LOOP_PRINT_ESP:

    ;Aqui é onde começa a impressão da matriz na interface. Onde DI tem a linha, e BX a coluna.
    MOV AH,2
    MOV DL,[DI+BX]
    INT 21h
    INT 21H
    int 21h
    Print_Char 219

    ;Incrementa BX para passar ao próximo espaço.
    INC BX

    ;Checa se já printou os 10 valores da linha da matriz.
    CMP BX,10
    JNE LOOP_PRINT_ESP

    ;Inicializa BX para ser usado novamente como indice.
    XOR BX,BX

    ;Chama um procedimento que está em partes no PULAR LINHA, mas os contextos são diferentes,
    ;este printa nas linhas onde estão os espaços da matriz, que são alterados a todo momento.
    CALL INFO_SCORE

    Print_Char 10

    CALL PRINTAR_LINHA
    

LOOP LOOP_PRINT_LET

    ;Printa a linha de asterisco da interface.
    MOV AH,9
    LEA DX,LINHA_AST
    INT 21h

    ;Reinicia o contador das letras.
    MOV CNTD_LETRAS,65

    ;Retorna todos os registradores.
    Load_Regs
    LEA DI,MATRIZINICIAL
    RET

INTERFACE ENDP

INFO_SCORE PROC

    ;Procedimento muito parecido com o PRINTAR LINHA, mas esse é apenas para o score que aparece
    ;do lado, enquanto o outro era em linhas sem nenhum valor que mudasse, esse é na linha
    ;onde são exibidos os quadrados da matriz, que são alterados a todo momento.

    ;Todos os prints do score são divididos, onde tem o começo da string, o valor que quero colocar e mudar
    ;e o resto da string, assim crio duas strings, printo a primeira, printo o valor, e depois printo o resto da string.

    MOV AH ,9
    CMP DI,0                ;Verifica em qual linha DI está, para que possa printar a frase certa na sua linha.
    JE NOME_SCORE_OUROS
    ADD DI,10               ;Para que eu possa usar o valor antigo de DI, para checar se estava no inicio ou não.
    CMP DI,30
    JE SCORE_ESPADAS
    CMP DI,40
    JE NOME_SCORE_COPAS
    CMP DI,60
    JE SCORE_ZAP
    JMP INTERFACE_SCORE_FIM
    
NOME_SCORE_OUROS:
    LEA DX, CNT_OUROS
    INT 21H
    ADD DI,10               ;Caso não seja adicionado 10 pois DI era 0, é agora.
    JMP INTERFACE_SCORE_FIM

SCORE_ESPADAS:
    MOV AH,9
    LEA DX, CNT_NUM_SPC
    INT 21H
    MOV AH,2
    MOV DL,QNT_ESPADAS_ABAT
    INT 21H
    MOV AH,9
    LEA DX, CNT_ESPADAS_NUM
    INT 21H
    JMP INTERFACE_SCORE_FIM

NOME_SCORE_COPAS:
    LEA DX, CNT_COPAS
    INT 21H
    JMP INTERFACE_SCORE_FIM

SCORE_ZAP:
    MOV AH,9
    LEA DX, CNT_NUM_SPC
    INT 21H
    MOV AH,2
    MOV DL,QNT_ZAP_ABAT
    INT 21H
    MOV AH,9
    LEA DX, CNT_ZAP_NUM
    INT 21H

INTERFACE_SCORE_FIM:
    RET    

INFO_SCORE ENDP

PRINTAR_LINHA PROC

    ;Aqui é onde começa o print da tabela de quantos navios ja foram derrubados.
    MOV AH,9

    ;Verifica a linha em que DI está, para saber qual parte da interface do score deve printar.
    CMP DI,10
    JE SCORE_OUROS
    CMP DI,20
    JE NOME_SCORE_ESPADAS
    CMP DI,40
    JE SCORE_COPAS
    CMP DI,50
    JE NOME_SCORE_ZAP
    MOV AH,9
    LEA DX,LINHA_219_NORMAL
    INT 21h
    JMP INTERFACE_SCORE2_FIM
    
    ;Exemplo, se for uma linha onde é exibido a contagem do submarino (ouros), 
    ;ele irá printar o começo da linha normal, depois quantos submarinos foram abatidos, 
    ;e depois o contador de quantos são no total. Isso serve para os contadores das embarcações
    ;e para os nomes dos navios que aparecem acima delas.

SCORE_OUROS:
    MOV AH,9
    LEA DX, LINHA_219_OURN      
    INT 21H
    MOV AH,2
    MOV DL, QNT_OUROS_ABAT
    INT 21H
    MOV AH,9
    LEA DX, CNT_OUROS_NUM
    INT 21H
    JMP INTERFACE_SCORE2_FIM

NOME_SCORE_ESPADAS:
    LEA DX, LINHA_219_ESP
    INT 21H
    LEA DX, CNT_ESPADAS
    INT 21H
    JMP INTERFACE_SCORE2_FIM

SCORE_COPAS:
    LEA DX, LINHA_219_COPN
    INT 21H
    MOV AH,2
    MOV DL, QNT_COPAS_ABAT
    INT 21H
    MOV AH,9
    LEA DX, CNT_COPAS_NUM
    INT 21H
    JMP INTERFACE_SCORE2_FIM

NOME_SCORE_ZAP:
    LEA DX, LINHA_219_ZAP
    INT 21H
    LEA DX, CNT_ZAP
    INT 21H
    JMP INTERFACE_SCORE2_FIM

INTERFACE_SCORE2_FIM:

    RET

PRINTAR_LINHA ENDP

PASSAR_PARAMETROS PROC

    ;Aqui o registrador BX tem os valores da linha (BH) e da coluna (BL) que o usuario digitou.

    ;Salva AX pois o valor dele pode ser necessario depois. E o valor que ira adquirir 
    PUSH AX

    ;Recarrega o valor original da matriz origem para que os parametros que o usuario digitou
    ;já sejam aplicados na matriz.
    MOV COMECO_MATRIZ_SI, SI

    XOR AH,AH

    ;O valor é passado para AL, pois não se pode passar um valor de um registrador de 8 bits em um de 16.
    MOV AL,BH

    ADD SI,AX   ;Aqui somo o deslocamento das linhas nos registradores das matrizes.
    ADD DI,AX
    XOR DX,DX
    MOV DL,BL   ;Salvo o numero da coluna em DL, pois depois irei precisar somar com um registrador 16 bits depois.

    POP AX  
    RET

PASSAR_PARAMETROS ENDP

COMP_MATRIZ PROC
    ;Faço com que DF seja 0.
    CLD
    ;Somo o deslocamento das colunas com o das linhas nos indices da matriz.
    ADD SI,DX
    ADD DI,DX
    ;Passo o que está no endereço desejado pelo usuario na matriz origem, para BX.
    MOV BX,[SI]
    ;BX vai ter o resultado repetudo em BH e BL.
    XOR BH,BH
    ;Checa qual embarcação o usuario acertou, ou se não acertou nenhuma.
    CMP BX,0
    JE COMP_ERROU
    CMP BX,1
    JE COMP_ACERTOU_OUROS
    CMP BX,2
    JE COMP_ACERTOU_ESPADAS
    CMP BX,3
    JE COMP_ACERTOU_COPAS
    CMP BX,4
    JE COMP_ACERTOU_ZAP

COMP_ERROU:
    ;Se errou o espaço será trocado por espaços (ASCII: 32)
    MOV AL,32
    ;Como o ponteiro está apontando para a mesma posição que o usuario digitou, o valor do espaço
    ;é substituido por 32, assim revelando se ele acertou ou não.
    STOSB
    RET

COMP_ACERTOU_OUROS:
    ;Código ASCII estendido para ♦ (Submarino)
    MOV AL,4
    STOSB
    INC QNT_OUROS_ABAT_PARC         ;Aqui é a contagem de quantas partes da embarcação o usuario acertou.
    CMP QNT_OUROS_ABAT_PARC,2       ;Checa se ele acertou a quantidade de espaços da embracação.
    JE COMP_ACERTOU_OUROS_TOTAL     ;E se acertou todos, conta como uma embarcação derrubada, mudando
    RET                             ;o score da interface.

COMP_ACERTOU_OUROS_TOTAL:
    MOV QNT_OUROS_ABAT_PARC,0       ;Reinicia o contador das partes da embarcação para a próxima.
    INC QNT_OUROS_ABAT              ;Incrementa o numero de embarcações daquele tipo derurbadas.
    INC QNT_ABAT_TOTAL              ;Incrementa o total de embarcações derrubadas para determinar
    RET                             ;o fim do jogo.

COMP_ACERTOU_ESPADAS:
    ;Código ASCII estendido para ♠ (Fragata)
    MOV AL,6
    STOSB
    INC QNT_ESPADAS_ABAT_PARC
    CMP QNT_ESPADAS_ABAT_PARC,3
    JE COMP_ACERTOU_ESPADAS_TOTAL
    RET

COMP_ACERTOU_ESPADAS_TOTAL:
    MOV QNT_ESPADAS_ABAT_PARC,0
    INC QNT_ESPADAS_ABAT
    INC QNT_ABAT_TOTAL
    RET

COMP_ACERTOU_COPAS:
    ;Código ASCII estendido para ♥ (Encouraçado)
    MOV AL,3
    STOSB
    INC QNT_COPAS_ABAT_PARC
    CMP QNT_COPAS_ABAT_PARC,4
    JE COMP_ACERTOU_COPAS_TOTAL
    RET

COMP_ACERTOU_COPAS_TOTAL:
    MOV QNT_COPAS_ABAT_PARC,0
    INC QNT_COPAS_ABAT
    INC QNT_ABAT_TOTAL
    RET

COMP_ACERTOU_ZAP:
    ;Código ASCII estendido para ♣ (Hidroavião)
    MOV AL,5
    STOSB
    INC QNT_ZAP_ABAT_PARC
    CMP QNT_ZAP_ABAT_PARC,4
    JE COMP_ACERTOU_ZAP_TOTAL
    RET

    COMP_ACERTOU_ZAP_TOTAL:
        MOV QNT_ZAP_ABAT_PARC,0
        INC QNT_ZAP_ABAT
        INC QNT_ABAT_TOTAL
        RET

COMP_MATRIZ ENDP

PRINTAR_LETRAS PROC

    ;Usa uma variavel para saber em qual letra estava, assim continua de onde parou. Após acabar
    ;de rodar a interface, a variavel retorna ao valor de 48d, e assim ja é printada como caractere.
    MOV AH,2
    MOV DL,CNTD_LETRAS
    INT 21h
    ADD CNTD_LETRAS,1

    RET
PRINTAR_LETRAS ENDP

ZERAR_TUDO PROC
    ;Reinicia todos os contadores das embarcações.
    MOV QNT_OUROS_ABAT_PARC, 0
    MOV QNT_ESPADAS_ABAT_PARC, 0
    MOV QNT_COPAS_ABAT_PARC, 0
    MOV QNT_ZAP_ABAT_PARC, 0

    ;E ja soma 48 para as que os numeros sejam printados no score na próxima.
    MOV QNT_OUROS_ABAT, 48
    MOV QNT_ESPADAS_ABAT, 48
    MOV QNT_COPAS_ABAT, 48
    MOV QNT_ZAP_ABAT, 48

    MOV QNT_ABAT_TOTAL, 0

    ;Zera a variavel que salva o endereço da matriz origem, que será alterada na próxima partida
    MOV COMECO_MATRIZ_SI, 0

    ;Reinicia a matriz exibida na interface, a matriz destino.
    LEA DI,MATRIZINICIAL
    MOV CX,5

    ZERAR_MATRIZ_LOOP:
        PUSH CX
        XOR BX,BX
        MOV CX,10
    ZERAR_LOOP1:
        MOV MATRIZINICIAL[DI+BX],176
        INC BX
        LOOP ZERAR_LOOP1
        XOR BX,BX
        ADD DI,10
        MOV CX,10
    ZERAR_LOOP2:
        MOV MATRIZINICIAL[DI+BX],177
        INC BX
        LOOP ZERAR_LOOP2
        ADD DI,10
        POP CX
        LOOP ZERAR_MATRIZ_LOOP

        RET

ZERAR_TUDO ENDP

TELA_VENCEU_PROC PROC 
    
    ;Para que possa ser feita a seleção da opção.
    XOR BX,BX

    ;Inicia o print da interface de vitória.
    ESCOLHASF_INICIO:
        MOV AH, 9
        LEA DX, TELA_INICIAL
        INT 21h
        LEA DX, TELA_VENCEU_3
        INT 21h
        LEA DX, TELA_VENCEU_4
        INT 21h
        LEA DX, TELA_VENCEU_5
        INT 21h
        LEA DX, TELA_VENCEU_6
        INT 21h
        LEA DX, TELA_VENCEU_7
        INT 21h
        LEA DX, TELA_INICIAL2
        INT 21h
        LEA DX, TELA_VENCEU_9
        INT 21h
        LEA DX, TELA_VENCEU_10
        INT 21h
        LEA DX, TELA_VENCEU_11
        INT 21h
        LEA DX, TELA_VENCEU_12
        INT 21h
        LEA DX, TELA_VENCEU_13
        INT 21h
        LEA DX, TELA_VENCEU_13_
        INT 21h
        LEA DX, TELA_VENCEU_14
        INT 21h
        LEA DX, TELA_VENCEU_15
        INT 21h
        LEA DX, TELA_VENCEU_16
        INT 21h
        LEA DX, TELA_VENCEU_17
        INT 21h
        LEA DX, TELA_VENCEU_18
        INT 21h
        LEA DX, TELA_INICIAL2
        INT 21h

        ;Segue a exata mesma lógica da seleção na tela principal. Apenas as
        ;opções de seleção são diferentes.
        CMP BL,0
        JNE ESCOLHASF_1
        LEA DX, TELA_VENCEU_JOGAR
        INT 21H
        JMP ESCOLHASF_1_

    ESCOLHASF_1:
        LEA DX, TELA_VENCEU_20
        INT 21H

    ESCOLHASF_1_:
        CMP BL,1
        JNE ESCOLHASF_2
        LEA DX, TELA_VENCEU_MENU
        INT 21H
        JMP ESCOLHASF_2_

    ESCOLHASF_2:
        LEA DX, TELA_VENCEU_21
        INT 21H

    ESCOLHASF_2_:
        CMP BL,2
        JNE ESCOLHASF_3
        LEA DX, TELA_VENCEU_SAIR
        INT 21H
        JMP ESCOLHASF_3_

    ESCOLHASF_3:
        LEA DX, TELA_VENCEU_22
        INT 21H

    ESCOLHASF_3_:
        LEA DX, TELA_INICIAL2
        INT 21h
        LEA DX, LINHA_AST2
        INT 21h

        MOV AH,8
        INT 21H

        CMP AL,'U'
        JE ESCOLHASF_U
        CMP AL,'u'
        JE ESCOLHASF_U

        CMP AL,'j'
        JE ESCOLHASF_J
        CMP AL,'J'
        JE ESCOLHASF_J

        CMP AL,13
        JE ESCOLHASF_FIM

    ESCOLHASF_U:
        DEC BL
        JMP ESCOLHASF_JMP
    ESCOLHASF_J:
        INC BL
    ESCOLHASF_JMP:
        JMP ESCOLHASF_INICIO

    ESCOLHASF_FIM:
    
        CMP BL,1
        JE ESCOLHASF_MENU

        CMP BL,2
        JE ESCOLHASF_SAIR

        XOR DX,DX
        ;Se o usuario quiser jogar novamente não ocorre nenhum jump, e volta ao MAIN
        ;com 0 em DX. No MAIN contece a comparação para saber se volta do menu, do jogo ou se sai.
        RET

        ;A mudança é apenas aqui, no que acontece se cada opção for selecionada.
    ESCOLHASF_MENU:
        ;Se quiser ir ao menu é incrementado 1 a DX.
        MOV DX,1
        RET

    ESCOLHASF_SAIR:
        ;Se escolher sair apenas sai do procedimento e finaliza o programa no próprio main.
        MOV DX,2
        RET

    PRESS_ESC_VENCEU:

        Sair_Jogo

TELA_VENCEU_PROC ENDP

TELA_USUARIO_PROC PROC

    ;Lê o nome e armazena em "Nome"
    MOV CX, 10                      ;Limita a leitura a 10 caracteres.
    XOR BX, BX                      ;Usa BX como indice.

    USUARIO_LOOP:

        CALL INTERFACE_USUARIO             ;Chama o procedimento que printa a interface.

        MOV AH,8                           ;Função para ler um caractere sem exibir ele no prompt.
        INT 21h

        CMP AL, 13                         ;Verifica se o usuário pressionou "Enter" (ASCII 13)
        JE USUARIO_XOR_BX

        MOV Nome[BX], AL                   ;Armazena o caractere no vetor.
        ADD ALEATORIO,AX

        INC BX                             ;Incrementa o índice.
        LOOP USUARIO_LOOP

    USUARIO_XOR_BX:
    
        MOV CX,11
        XOR BX,BX

    ;Segue a mesma lógica do de cima, é a 2 caixa de texto na tela inicial.
    USUARIO_LOOP2:

        CALL INTERFACE_USUARIO

        MOV AH,8                        
        INT 21h

        CMP AL, 13    
        JE USUARIO_FIM

        MOV Palavra[BX], AL   
        ADD ALEATORIO,AX

        INC BX        
        LOOP USUARIO_LOOP2

    USUARIO_FIM:
    
    ;Checa se o usuario terminou de digitar para exibir a mensagem de "pressione enter para continuar"
    INC USUARIO_TERMINOU
    CALL INTERFACE_USUARIO
    ENTER_USUARIO:
    MOV AH,8                ;Para que o usuario tenha certeza do que enviou antes de prosseguir.
    INT 21H
    CMP AL,13
    JNE ENTER_USUARIO
    
    RET

TELA_USUARIO_PROC ENDP

INTERFACE_USUARIO PROC

        ;Printa a interface de inicio.
        MOV AH,9
        LEA DX,TELA_INICIAL
        INT 21H

        LEA DX,ONDAS1
        INT 21H
        LEA DX,ONDAS3
        INT 21H
        LEA DX,ONDAS1
        INT 21H

        LEA DX,ONDAS_NOME
        INT 21H

        LEA DX,PARTE_CIMA
        INT 21H      
        LEA DX,PARTE_MEIO
        INT 21H  

        ;Imprime na caixa da tela o que o usuario digita.
        PUSH CX
        PUSH BX
        CALL IMPRIMIR_VET
        POP BX
        POP CX

        ;Segue a mesma lógica do score, onde a linha é quebrada em duas para que
        ;possa alterar o que tem no meio.
        MOV AH,9
        LEA DX,PARTE_MEIO2
        INT 21H
        LEA DX,PARTE_BAIXO
        INT 21H

        LEA DX,ONDAS2
        INT 21H

        LEA DX,ONDAS_PENSA
        INT 21H

        LEA DX,PARTE_CIMA
        INT 21H      
        LEA DX,PARTE_MEIO
        INT 21H  

        ;Imprime na segunda caixa.
        PUSH CX
        PUSH BX
        CALL IMPRIMIR_VET2
        POP BX
        POP CX

        MOV AH,9
        LEA DX,PARTE_MEIO2
        INT 21H
        LEA DX,PARTE_BAIXO
        INT 21H

        LEA DX,ONDAS3
        INT 21H
        LEA DX,ONDAS1
        INT 21H

        ;Compara se o usuario terminou, para que possa ser exibida a mensagem de pressionar ENTER.
        CMP USUARIO_TERMINOU,1
        JNE USUARIO_N_TERMINOU
        LEA DX,ONDAS_ENTER
        JMP USUARIO_S_TERMINOU
    USUARIO_N_TERMINOU:
        LEA DX,ONDAS2
    USUARIO_S_TERMINOU:
        INT 21H
        LEA DX,ONDAS1
        INT 21H
        LEA DX,LINHA_AST2
        INT 21H

        RET

INTERFACE_USUARIO ENDP

IMPRIMIR_VET PROC

        ;Exibe os caracteres armazenados em "Nome" na caixa da tela inicial.
        MOV CX, 10                         ;Define CX como o número de caracteres da caixa.
        XOR BX, BX                         ;Reinicializa o índice para começar do início do vetor
        MOV AH, 2
    EXIBIR_LOOP:
        MOV DL, Nome[BX]                   ;Carrega o caractere do vetor em DL para ser printado.
        INT 21h
        INC BX                             ;Próximo caractere
        LOOP EXIBIR_LOOP
        RET

IMPRIMIR_VET ENDP

IMPRIMIR_VET2 PROC

        ;Mesma lógica do IMPRIMIR_VET mas é para a caixa de baixo.
        MOV CX, 10
        XOR BX, BX
        MOV AH, 2
    EXIBIR_LOOP2:
        MOV DL, Palavra[BX]
        INT 21h
        INC BX
        LOOP EXIBIR_LOOP2
        RET

IMPRIMIR_VET2 ENDP

END MAIN
