#// programa 9
#Considere a memória inicial da seguinte forma:
#.text
#.data
#x1: .word 15
#x2: .word 25
#x3: .word 13
#x4: .word 17
#soma: .word -1
#Escrever um programa que leia todos os números, calcule e substitua o valor da variável soma por
#este valor.

#0x1001000 -> $s0
#x1, x2, x3, x4 -> $t0
#x3 -> $s2
#x4 -> $s3
#soma -> $s1

.data 

x1: .word 15
x2: .word 25
x3: .word 13
x4: .word 17
soma: .word -1

.text

.globl main

main:
lui $s0,0x1001
lw $t0,0($s0)
add $s1,$s1,$t0
lw $t0,4($s0)
add $s1,$s1,$t0
lw $t0,8($s0)
add $s1,$s1,$t0
lw $t0,12($s0)
add $s1,$s1,$t0
