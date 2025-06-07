# // programa 17
# Para a expressão a seguir, escreva um programa que calcule o valor de k:
# k = x * y (Você deverá realizar a multiplicação através de somas!)
# O valor de x deve ser lido da primeira posição livre da memória e o valor de y deverá lido da
# segunda posição livre. O valor de k, após calculado, deverá ainda ser escrito na terceira posição
# livre da memória.

# Associações:
# x -> $s0
# y -> $s1
# z -> $s2

.data

x: .word 10
y: .word 3
k: .word 0

.text

.globl main

main:
lui $s5,0x1001
lw $s0,0($s5) # x = 10
lw $s1,4($s5) # y = 3
lw $s2,8($s5) # z = 0
or $t0,$zero,$s1 # t0 = 3


mutiplica:
add $t1,$t1,$s0 # t1 = t1 + x
addi $t0,$t0,-1 # t0 = t0 -1
bne $t0,$zero,mutiplica # t0 != 1 -> multiplica

sw $t1,8($s5)


