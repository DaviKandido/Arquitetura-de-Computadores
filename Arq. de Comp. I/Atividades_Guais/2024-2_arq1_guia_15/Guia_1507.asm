; 857859 - Davi Cândido de Almeida

; Redireciona PC para a MAIN
JMP MAIN

; Definição de funções

INICIALIZAR:
	LXI H,C100
	MVI M,09H	; Inicializa dado01 = 10
	LXI H,C110	; Inicializa dado02 = 8
	MVI M,08H 

	RET

DIVIDIRx4:
	MOV A,M
	RRC	; Rotação no A, divisão por 2 
	RRC	; Rotação no A, divisão por 2 novamente (Dividir por 4)

	RET

RESTOx2:	
	MOV A,M
	ANI 01H         ; Isola o LSB (A <- A AND 01H), Resto por 2

	RET
	


MAIN: 
	CALL INICIALIZAR

	; Calcula resto de dados1%2
	LXI H,C100
	CALL RESTOx2
	STA C102

	; Calcula divisão de dados2/4
	LXI H,C110
	CALL DIVIDIRx4
	STA C112

	; Soma final
	LDA C102
	LXI H,C112
	ADD M	      ; Efetua Soma final
	STA C130	  ; Guarda na memoria resultado em C130

	HLT	; Fim
