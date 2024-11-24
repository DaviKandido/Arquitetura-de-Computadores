; Guia_1607c.txt
; 857859 - Davi Cândido de Almeida
;
; 07.) Implementar um programa (Guia_1607.txt) para o processador 8085 para
; calcular o fatorial de um dado de 8 bits.
; dado02 = FAT (dado01)

; Redireciona PC para a MAIN
JMP MAIN

; Função de Inicialização
INIT:
    LXI H,C100      ; Aponta para o início da memória
    MVI M,05H       ; Inicializa dado01 = 5
    RET

; Função de Multiplicação por somas sucessivas
IMUL:
    MOV E,B        
    MVI A,00
    LOOP: 
        ADD D
        DCR E
        JNZ LOOP
    MOV D,A
    RET

; Programa Principal
MAIN: 
    CALL INIT        ; Inicializa variáveis
    LXI H,C100	   ; Aponta para os dados na memória
    MOV B,M
    MVI D,01

FAT:
    CALL IMUL
    DCR B
    JNZ FAT
    INX H
    INX H
    MOV M,D

    HLT
END:

; Entrada 05H   -> 5.4.3.2.1 = 20.3.4.2 = 60.2.1 = 120.1 = 120
; Saida 78H -> 120 em hexadecimal
