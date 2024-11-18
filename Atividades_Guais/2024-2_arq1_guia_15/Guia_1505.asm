; 857859 - Davi Cândido de Almeida

; Redireciona PC para a MAIN
JMP MAIN

; Definição de funções

INICIALIZAR:
	MVI A,05H        
	STA C100
	MVI A,04H        
	STA C110
	RET       ; Retorna a MAIN       

DIVIDIR:	
	RRC       ; Rotação no A, divisão por 2       
	RET

MULT:
	MVI A,00H       ; Inicializa Somas/Mult em 0  
BACK:	ADD B         
	DCR C          
	JNZ BACK       
	RET

MAIN:	
	CALL INICIALIZAR ;Função para inicializar variaveis

	; Multiplicação: 8 * dado01 (C100)
	MVI C,08H       ; Guarda numero para multiplicação
	LXI H,C100
	MOV B,M         
	CALL MULT       
	STA C102        ;Guarda multiplicação

	; Divisão: dado02 / 2 (C110)
	LDA C110        
	CALL DIVIDIR    
	STA C112        ;Guarda Divisão

	; Soma final: (8 * dado01) + (dado02 / 2)
	LDA C112        
	LXI H,C102      
	ADD M           ; Efetua soma final
	STA C120        ; Guarda na memoria resultado

	HLT             ; Fim
