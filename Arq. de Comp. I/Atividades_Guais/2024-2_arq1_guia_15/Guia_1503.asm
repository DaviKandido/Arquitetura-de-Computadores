; 857859 - Davi Cândido de Almeida

; Carregar endereço inicial dos dados
LXI H, 0100

; Carregar dado01 no acumulador A
MOV A,  M

; Subtrair dado02 e ajustar para BC
INX H
SUB M
DAA

; Adicionar dado03 e ajustar para BC
INX H
ADD M
DAA

; Adicionar dado04 e ajustar para BC
INX H
SUB M
DAA

; Armazenar o resultado em dado05
INX H
MOV M,  A

HLT