# // programa 14:
# Escreva um programa que leia um valor A da memória, identifique se o número é par ou não.
# Um valor deverá ser escrito na segunda posição livre da memória (0 para par e 1 para ímpar).

# $0 -> 0X10010000
# A -> $S1

.data
p1: .word 4

.text

.globl main

main:
lui $s0,0x1001
lw $s1, 0($s0)
ori $t0,$zero,1
andi $t1,$s1,1
beq $t1,$t0,impar

par:
or $t0,$zero,$zero
sw $t0,4($s0)

fim: j fim

impar:
sw $t0,4($s0) 


 