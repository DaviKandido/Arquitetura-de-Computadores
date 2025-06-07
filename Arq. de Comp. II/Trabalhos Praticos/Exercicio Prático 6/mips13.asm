# // programa 13:
# Escreva um programa que leia um valor A da memória, identifique se o número é negativo ou
# não e encontre o seu módulo. O valor deverá ser reescrito sobre A.

# $0 -> 0X10010000
# A -> $S1

.data
p1: .word -43

.text

.globl main

main:
lui $s0,0x1001
lw $s1, 0($s0)
lui $t0, 0x8000
and $t1,$s1,$t0
beq $t1,$t0,negativo

j fim
negativo:
not $t1,$s1
addi $s1,$t1,1 

fim:
sw $s1,($s0)
 
