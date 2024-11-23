; Guia_1600b.txt
; 857859 - Davi Cândido de Almeida
;
; Adição de dois números de 8 bits chamando a função add usando a pilha
; Armazene manualmente o 1º número na posição de memória 0050h
; Armazene manualmente o 2º número na posição de memória 0051h
; O resultado é armazenado em 0052h
;
; F_ADD - Função ADD ; A = add (B, C)
; @retorna A
; @parâmetro B
; @parâmetro C
;
   
   
                             JMP MAIN
                             
                             
F_ADD : 
                             POP H
                             POP D
                             MVI A,00
                             
                             MOV A,D
                             ADD E
                             PUSH H
                             RET
MAIN : 
                             LXI H,C050
                             
                             
                             MOV B,M
                             INX H
                             MOV C,M
                             PUSH B
C_ADD : 
                             CALL F_ADD
                             
                             
                             STA C052
                             
                             
                             HLT
