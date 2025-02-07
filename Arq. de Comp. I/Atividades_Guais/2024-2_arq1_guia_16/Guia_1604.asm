; Guia_1603c.txt
; 857859 - Davi Cândido de Almeida
;
; 04.) Implementar um programa (Guia_1604.txt) para o processador 8085 para
; encontrar o maior valor de um arranjo.
; DICA: Usar o exemplo do BubbleSort, mas não ordenar. Usar a repetição.

; Redireciona PC para a MAIN
JMP MAIN

; Função de Inicialização
INIT:
    LXI H,C100      ; Aponta para o início da memória
    MVI M,10H      
    INX H
    MVI M,07H       
    INX H
    MVI M,42H  
    INX H
    MVI M,20H
    INX H
    MVI M,35H
    INX H
    MVI M,52H
    INX H
    MVI M,18H
    INX H
    MVI M,39H
    INX H
    MVI M,47H
    INX H
    MVI M,28H        
    RET

; Função para encontra o maior numero em um arranjo
GETMAIOR: 
    MOV A,M
    BACK: INX H
          CMP M
          JNC MENOR
          MOV A,M
   MENOR: DCR C
          JNZ BACK
          RET 

; Programa Principal
MAIN: 
    CALL INIT        ; Inicializa variáveis
    LXI H,C100       ; Aponta para os dados na memória

    MVI C,10H  
    CALL GETMAIOR        ; Chama a função de GetMaior
    STA C110         ; Armazena o resultado

    HLT              ; Finaliza o programa

END:


