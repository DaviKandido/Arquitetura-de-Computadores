; Guia_1600a.txt
; 857859 - Davi Cândido de Almeida
;
; Adição de dois números de 8 bits chamando a função add
; Armazene manualmente o 1º número na posição de memória 0050h
; Armazene manualmente o 2º número na posição de memória 0051h
; O resultado é armazenado em 0052h
;
; F_ADD - Função ADD ; A = add (B, C)
; @retorna A
; @parâmetro B
; @parâmetro C



                            ; Redireciona PC para a MAIN
                             JMP MAIN
                             
                             
F_ADD : 
                             LDA AA00
                             
                             
                             MOV D,B
                             MOV E,C
                             MOV A,D
                             ADD E
                             RET
                             NOP
MAIN : 
                             LXI H,C050
                             
                             
                             MOV B,M
                             INX H
                             MOV C,M
C_ADD : 
                             CALL F_ADD
                             
                             
                             STA C052
                             
                             
                             HLT
