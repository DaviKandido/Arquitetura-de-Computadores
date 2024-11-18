; 857859 - Davi Cândido de Almeida

; Redireciona PC para a MAIN
JMP MAIN

; Definição de funções

INICIALIZAR:
	LXI H,C100
	MVI M,06	 ; Inicializa dado01 = 6
	LXI H,C110
	MVI M,05	; Inicializa dado02 = 5

	RET		; Retorna a MAIN

MULT: 	
	MOV B,M		; Coloca no registrador o valor a se multiplicar
	MVI A,00H
           BACK:  ADD B
	DCR C
	DAA
	JNZ BACK		; Condição de incremento
	
	RET


MAIN:
	CALL INICIALIZAR	; Inicializa variaveis

	;Primeira Multiplicação
	LXI H,C100
	MVI C,03H		; Defini o valor a se multiplicar
	CALL MULT
	STA C102
	
	;Segunda Multiplicação
	LXI H,C110
	MVI C,02H
	CALL MULT
	STA C112

	; Subtração final: (dado01 * 3) - (dado02 * 2)
	LDA C102          
	LXI H,C112        
	SUB M             
	STA C130          ; Armazena o resultado final em C130

	HLT               ; Fim do programa