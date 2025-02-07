; 857859 - Davi Cândido de Almeida
 
; Guarda Valores nos enderecos a se usar
MVI B,05H
LXI H,C100
MOV M,B

MVI B,03H
LXI H,C101
MOV M,B


;Guarda o segundo Valor
LXI H,C101
MOV A,M

;Faz o dobro do segundo Valor
ADD A

;Subtrai com o segundo Valor
LXI H,C100
SUB M

;Faz o dobro do resultado
ADD A

;Guarda resultado na memoria no endereco C110
LXI H,C110
MOV M,A

HLT
