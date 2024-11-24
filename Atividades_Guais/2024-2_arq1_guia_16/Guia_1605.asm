; Guia_1603c.txt
; 857859 - Davi Cândido de Almeida
;
; 05.) Implementar um programa (Guia_1605.txt) para o processador 8085 para
; converter um valor em BCD (Binary Coded Decimal)
; para o hexadecimal equivalente.
; DICA: 24 (BCD) = 24 (10) = HI (24) * 10 + LOW (24) = 2 * 10 + 4
;  = 0000 0010(2) * 0000 1010(2) + 0000 0100(2) = 0001 0100(2) + 0001 1000(2) = 18 (16)
; dado02 = HI (dado01) * 10 + LOW (dado02)

; Redireciona PC para a MAIN
JMP MAIN

; Função de Inicialização
INIT:
    LXI H,C100      ; Aponta para o início da memória
    MVI M,22      
    LXI H,C110 
    MVI M,43             
    RET

; Função para converter um valor em BCD (Binary Coded Decimal) para o hexadecimal equivalente.
PARSETOHEXA: 
    MOV D,B
	MOV E,B
	MVI A,0F
	ANA E
	MOV E,A
	MVI A,F0
	ANA D
	RAR
	RAR
	RAR
	RAR
	MOV D,A
	MVI A,00
	MVI C,0A
MULT:   ADD D
	    DCR C
	    JNZ MULT
	ADD E
	RET

; Programa Principal
MAIN: 
    CALL INIT               ; Inicializa variáveis
    LXI H,C100              ; Aponta para os dados na memória
    MOV B,M
    CALL PARSETOHEXA        ; Chama a função de PARSETOHEXA
    STA C102                ; Armazena o resultado 1

    LXI H,C110
    MOV B,M
    CALL PARSETOHEXA        ; Chama a função de PARSETOHEXA
    STA C112                ; Armazena o resultado 2

    HLT                     ; Finaliza o programa

END:

; Entrada 22 -> saida 16 em hexadecimal
; Entrada 43 -> saida 2B em hexadecimal
