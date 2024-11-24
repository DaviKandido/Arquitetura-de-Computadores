; Guia_1603c.txt
; 857859 - Davi Cândido de Almeida
;
; 03.) Implementar um programa (Guia_1603.txt) para o processador 8085 para
; calcular o resto inteiro (IMOD) da divisão entre dois dados
; com 8 bits cada.
; DICA: Usar subtrações sucessivas.
; dado03 = dado01 % dado022

; Redireciona PC para a MAIN
JMP MAIN

; Função de Inicialização
INIT:
    LXI H,C100      ; Aponta para o início da memória
    MVI M,10H       ; Inicializa dado01 = 16 em Hex
    INX H
    MVI M,07H       ; Inicializa dado02 = 7
    RET

; Função para calcula modulo por subtrações sucessivas
IMOD:
	MOV A,B
	MVI B,00	; Inicializa o registrador B (contador de subtrações) com 0
BACK: INR B	    ; Incrementa B (contador de subtrações)
	  SUB C
      JC FIM    ; Se o carry for gerado -> não pode subtrair mais (pula para FIM)
	  JNZ BACK
FIM:  ADD C
	  RET

; Programa Principal
MAIN: 
    CALL INIT        ; Inicializa variáveis
    LXI H,C100       ; Aponta para os dados na memória
    MOV B,M
    INX H 
    MOV C,M  
    CALL IMOD        ; Chama a função de multiplicação
    STA C103         ; Armazena o resultado

    HLT              ; Finaliza o programa

END:


