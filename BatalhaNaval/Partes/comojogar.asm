.MODEL SMALL
.DATA 
    TELA_REGRA_1  DB '************************************************************ $'
    TELA_REGRA_2  DB 10,13,'*     ___                                                  * $'
    TELA_REGRA_3  DB 10,13,'*    / __\  ___   _ __ ___    ___                          * $'
    TELA_REGRA_4  DB 10,13,"*   / /    / _ \ | '_ ` _ \  / _ \                         * $"
    TELA_REGRA_5  DB 10,13,'*  / /___ | (_) || | | | | || (_) |     ',05h,'  HIDRO-AVIÃO    * $'
    TELA_REGRA_6  DB 10,13,'*  \____/  \___/ |_| |_| |_| \___/                         * $'
    TELA_REGRA_7  DB 10,13,'*    __                                 ',03h,'  ENCOURAÇADO    * $'
    TELA_REGRA_8  DB 10,13,'*    \ \   ___    __ _   __ _  _ __                        * $'
    TELA_REGRA_9  DB 10,13,'*     \ \ / _ \  / _` | / _` || `__|    ',06h,'  FRAGATA         * $'
    TELA_REGRA_10 DB 10,13,'*  /\_/ /| (_) || (_| || (_| || |                          * $'
    TELA_REGRA_11 DB 10,13,'*  \___/  \___/  \__, | \__,_||_|       ',04h,'  SUBMARINO       * $'
    TELA_REGRA_12 DB 10,13,'*                |___/                                     * $'
    TELA_REGRA_13 DB 10,13,'*                                                          * $'
    TELA_REGRA_14 DB 10,13,'* Objetivo: Afundar todas as embarcacoes do oponente       * $'
    TELA_REGRA_15 DB 10,13,'*                                                          * $'
    TELA_REGRA_16 DB 10,13,'* Digite a linha (A-J) e a coluna (0-9) para atirar        * $'
    TELA_REGRA_17 DB 10,13,'*                                                          * $'
    TELA_REGRA_18 DB 10,13,'* Ao acertar um barco, ele sera marcado com "X"            * $'
    TELA_REGRA_19 DB 10,13,'*  _______                                                 * $'
    TELA_REGRA_20 DB 10,13,'* | ENTER |                                                * $'
    TELA_REGRA_21 DB 10,13,'* |__     | para voltar ao menu inicial                    * $'
    TELA_REGRA_22 DB 10,13,'*    |    |                                                * $'
    TELA_REGRA_23 DB 10,13,'*    |____|                                                * $'
    TELA_REGRA_24 DB 10,13,'************************************************************ $'
.CODE
    MAIN PROC
        mov ax,@data
        mov ds,ax

        mov ah,9
        EXIBIR:
        lea dx,TELA_REGRA_1
        int 21h

        lea dx,TELA_REGRA_2
        int 21h

        lea dx,TELA_REGRA_3
        int 21h

        lea dx,TELA_REGRA_4
        int 21h

        lea dx,TELA_REGRA_5
        int 21h

        lea dx,TELA_REGRA_6
        int 21h

        lea dx,TELA_REGRA_7
        int 21h

        lea dx,TELA_REGRA_8
        int 21h

        lea dx,TELA_REGRA_9
        int 21h

        lea dx,TELA_REGRA_10
        int 21h

        lea dx,TELA_REGRA_11
        int 21h

        lea dx,TELA_REGRA_12
        int 21h

        lea dx,TELA_REGRA_13
        int 21h

        lea dx,TELA_REGRA_14
        int 21h

        lea dx,TELA_REGRA_15
        int 21h

        lea dx,TELA_REGRA_16
        int 21h

        lea dx,TELA_REGRA_17
        int 21h
        
        lea dx,TELA_REGRA_18
        int 21h

        lea dx,TELA_REGRA_19
        int 21h

        lea dx,TELA_REGRA_20
        int 21h

        lea dx,TELA_REGRA_21
        int 21h

        lea dx,TELA_REGRA_22
        int 21h

        lea dx,TELA_REGRA_23
        int 21h

        lea dx,TELA_REGRA_24
        int 21h

    FIM:
    mov ah,4CH
    int 21h
    MAIN ENDP
end main
    


