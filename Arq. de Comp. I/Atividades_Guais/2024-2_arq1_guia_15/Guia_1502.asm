; 857859 - Davi Cândido de Almeida

; Valores de cada número guardados um abaixo do outro (2 unidades de memória cada)
; Valor final em C140 e C141
 
; Guarda valores nos endereços a se usar

; Primeiro valor
LXI H, C100
MVI M, 01H
LXI H, C101
MVI M, 02H

; Segundo valor
LXI H, C110
MVI M, 01H
LXI H, C111
MVI M, 02H

; Terceiro valor
LXI H, C120
MVI M, 01H
LXI H, C121
MVI M, 02H

; Efetuação das somas

; Soma dos dois primeiros índices de 8 bits (à direita)
LDA C101
LXI H, C111
ADD M

; Guarda resultado em endereço auxiliar
STA C104

; Soma dos dois segundos índices de 8 bits (à esquerda)
LXI H, C100
JNC AFTER1
INR A
AFTER1: LXI H, C110
ADD M

STA C103

; Soma resultado parcial com terceiro valor
LDA C104
LXI H, C121
ADD M
STA C104

LDA C120
JNC AFTER2
INR A
AFTER2: LXI H, C103
ADD M
STA C103

; Subtração
; Transforma em complemento de 2 e guarda em endereço auxiliar
LXI H, C131
MOV A, M
CMA
MOV B, A
INR B

LXI H, C130
MOV A, M
CMA
JNC AFTER3
INR A
AFTER3: STA C106
LXI H, C107
MOV M, B

; Subtrai a partir do complemento de 2 e guarda resultado
LDA C104
LXI H, C107
ADD M
STA C140

LDA C103
JNC AFTER4
INR A
AFTER4: LXI H, C106
ADD M
STA C141

HLT
