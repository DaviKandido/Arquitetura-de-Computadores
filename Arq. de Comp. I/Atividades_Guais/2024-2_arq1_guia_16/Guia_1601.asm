; Guia_1601c.txt
; 857859 - Davi Cândido de Almeida
;
; Implementar um programa (Guia_1601.txt) para o processador 8085 para
; calcular o produto (IMUL) de dois dados
; com 8 bits cada.
; DICA: Usar somas sucessivas e tamanho maior que 8 bits para o resultado.
; dado03 = dado01 * dado02

; Redireciona PC para a MAIN
JMP MAIN

; Função de Inicialização
INIT:
    LXI H,C100      ; Aponta para o início da memória
    MVI M,04H       ; Inicializa dado01 = 4
    INX H
    MVI M,03H       ; Inicializa dado02 = 3
    RET

; Função de Multiplicação por somas sucessivas
MULT:
    MVI A,OOH         
    MOV B,M          ; Multiplicando (dado01) no registrador A
    INX H
    MOV C,M         ; Multiplicador (dado02) no registrador C
BACK:
    ADC B           
    DCR C            
    JNZ BACK         ; Repete enquanto o contador não for zero
    RET

; Programa Principal
MAIN: 
    CALL INIT        ; Inicializa variáveis

    LXI H,C100	   ; Aponta para os dados na memória
    CALL MULT        ; Chama a função de multiplicação

    STA C103        ; Armazena o resultado

    HLT              ; Finaliza o programa

END:

