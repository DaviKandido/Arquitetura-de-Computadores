#// programa 12
#Considere a seguinte situação:
#int ***x;
#onde x contem um ponteiro para um ponteiro para um ponteiro para um inteiro.
#Nessa situação, considere que a posição inicial de memória contenha o inteiro em questão.
#Coloque todos os outros valores em registradores, use os endereços de memória que quiser dentro
#do espaço de endereçamento do Mips.
#Resumo do problema:
#k = MEM [ MEM [MEM [ x ] ] ].
#Crie um programa que implemente a estrutura de dados acima, leia o valor de K, o multiplique por
#2 e o reescreva no local correto conhecendo-se apenas o valor de x.

#Associações:
# k -> $s0


.data
p1: .word 0x10010004
p2: .word p3
p3: .word x
x: .word 10
K: .word 0 # esse valor deverá ser sobrescrito após a execução do programa

.text

.globl main

main:
lui $t0,0x1001
lw $t0,0($t0)
lw $t0,0($t0)
lw $t0,0($t0)
lw $s0,0($t0)
sw $s0,4($t0)

