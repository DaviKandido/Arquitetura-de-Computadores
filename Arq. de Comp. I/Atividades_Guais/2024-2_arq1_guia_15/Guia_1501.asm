; 857859 - Davi Cândido de Almeida
 
; Guarda Valores nos enderecos a se usar
MVI B,05H
LXI H,C100
MOV M,B

MVI B,03H
LXI H,C101
MOV M,B

MVI B,03H
LXI H,C102
MOV M,B

;Guarda o primeiro Valor
LXI H,C100
MOV A,M


;Soma segundo Valor
INX H
ADD M

;Subtrai segundo Valor
INX H
SUB M

;Guarda resultado na memoria
INX H
MOV M,A

HLT
