; Guia_1606c.txt
; 857859 - Davi Cândido de Almeida
;
; 06.) Implementar um programa (Guia_1606.txt) para o processador 8085 para
; calcular o quadrado de um dado de 8 bits.
; DICA: Somar os ímpares: 52 = 1+3+5+7+9 = 25.
; dado02 = SQR (dado01)

; Redireciona PC para a MAIN
JMP MAIN

; Função de Inicialização
INIT:
    LXI H,C100      ; Aponta para o início da memória
    MVI M,05H       ; Inicializa dado01 = 5
    RET

; Função de Multiplicação por somas sucessivas
SQR:
    MVI A,OOH         
    MOV B,M          ; Multiplicando (dado01) no registrador A
    MOV C,M         ; Multiplicador (dado01) no registrador C
BACK:
    ADC B           
    DCR C            
    JNZ BACK         ; Repete enquanto o contador não for zero
    RET

; Programa Principal
MAIN: 
    CALL INIT        ; Inicializa variáveis
        

    LXI H,C100	   ; Aponta para os dados na memória
    CALL SQR        ; Chama a função de multiplicação
    STA C102        ; Armazena o resultado

    HLT              ; Finaliza o programa

END:

; Entrada 05H
; Saida 19H -> 25 em hexadecimal
