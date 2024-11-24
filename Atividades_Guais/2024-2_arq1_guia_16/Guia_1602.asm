; Guia_1602c.txt
; 857859 - Davi Cândido de Almeida
;
; 02.) Implementar um programa (Guia_1602.txt) para o processador 8085 para
; calcular o quociente inteiro (IDIV) entre dois dados
; com 8 bits cada.
; DICA: Usar subtrações sucessivas e tamanho maior que 8 bits para o resultado.
; dado03 = dado01 / dado02

; Redireciona PC para a MAIN
JMP MAIN

; Função de Inicialização
INIT:
    LXI H,C100      ; Aponta para o início da memória
    MVI M,0FH       ; Inicializa dado01 = 16 em Hex
    INX H
    MVI M,07H       ; Inicializa dado02 = 7
    RET


; Função de Dividir por Subtrações sucessivas
IDIV:
	MVI B,00	; Inicializa o registrador B (contador de subtrações) com 0
BACK:
    SUB C           
    JC FIM          ; Se o carry for gerado -> A < C (não pode subtrair mais)
    INR B           ; Incrementa B (contador de subtrações)
    JMP BACK        ; Continua subtraindo enquanto A >= C
FIM:
    MOV A,B         ; Move o valor de B (contador de subtrações) para o acumulador A (quociente)
    RET

; Programa Principal
MAIN: 
    CALL INIT        ; Inicializa variáveis
    LXI H,C100      ; Aponta para os dados na memória
    MOV A,M
    INX H 
    MOV C,M  
    CALL IDIV        ; Chama a função de multiplicação
    STA C103        ; Armazena o resultado

    HLT              ; Finaliza o programa

END:


