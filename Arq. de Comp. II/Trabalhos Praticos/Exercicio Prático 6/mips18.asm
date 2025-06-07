# // programa 18
# Para a expressão a seguir, escreva um programa que calcule o valor de k:
# k = x^y
# Obs: Você poderá utilizar o exercício anterior.

# Associações:
# x -> $s0
# y -> $s1
# z -> $s2

.data

x: .word 3
y: .word 4
k: .word 0

.text

.globl main

main:
lui $s5,0x1001
lw $s0,0($s5) # x = 3
lw $s1,4($s5) # y = 4
lw $s2,8($s5) # z = 0

ori $t0,$zero,0 # t0 = 3
or $t2,$zero,$s0 # t0 = 3
or $t1,$zero,$s0# t0 = 3
or $t3,$zero,$s1
mutiplica:
add $t0,$t0,$t2 # t1 = t1 + x
addi $t1,$t1,-1 # t0 = t0 -1
bne $t1,$zero,mutiplica # t0 != 0 -> multiplica

or $t1,$zero,$s0# t1 = 3
add $t1,$t1,-1 # t1 = 2
or $t2,$zero,$t0 # t2 = 3
addi $t3,$t3,-1
bne $t3,1,mutiplica # t0 != 0 -> multiplica

sw $t1,8($s5)


