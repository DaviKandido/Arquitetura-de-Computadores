; 857859 - Davi Cândido de Almeida

;Carregar dados2
LXI H, 0100
MOV A, M
INX H
MOV B, M

;Carregar dados2
LXI H, 0102
ADD M
MOV C, A
MOV A, B
INX H
ADC M
MOV B, A

;Carregar dados3
LXI H, 0104
MOV A, C
ADD M
MOV C, A
MOV A, B
INX H
ADC M
MOV B, A

;Carrega dados 4 e subtrai com C2
LXI H, 0106
MOV A, C
SUB M
MOV C, A
MOV A, B 
INX H
SBB M
MOV B, A

;Coloca resultado na memoria
LXI H, 0108
MOV M, C
INX H
MOV M, B
HLT