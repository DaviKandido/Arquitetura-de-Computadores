# // programa 16
# Escreva um programa que avalie a expressão: (x*y)/z.
# Use x = 1600000 (=0x186A00), y = 80000 (=0x13880), e z = 400000 (=0x61A80). Inicializar os
# registradores com os valores acima.

# Associações:
# x -> $s0
# y -> $s1
# z -> $s2

.data

x: .word 0x186A00
y: .word 0x13880
z: .word 0x61A80

.text

.globl main

main:
lui $s5,0x1001
lw $s0,0($s5) # x = 1600000
lw $s1,4($s5) # y = 80000
lw $s2,8($s5) # z = 400000
or $t0,$zero,$s1 # t0 = 80000


mutiplica:
add $t1,$t1,$s0 # t1 = t1 + x
addi $t0,$t0,-1 # t0 = t0 -1
bne $t0,$zero,mutiplica # t0 != 1 -> multiplica

or $t0,$zero,$s2

divide:
sub $t1,$t1,$s2
addi $t0,$t0,-1
bne $t1,$zero,divide


