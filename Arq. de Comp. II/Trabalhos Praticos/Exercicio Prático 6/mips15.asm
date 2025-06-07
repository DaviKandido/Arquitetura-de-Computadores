# // programa 15:
# Escrever um programa que crie um vetor de 100 elementos na memória onde vetor[i] = 2*i +
# 1. Após a última posição do vetor criado, escrever a soma de todos os valores armazenados
# do vetor.
# Use o MARS para verificar a quantidade de instruções conforme o tipo (ULA, Desvios, Mem ou
# Outras)

.text

.globl main

main:
lui $s0,0x1001
ori $s2,$zero,99

loop:
sll $t0,$s2,1
addi $t0,$t0,1
sll $t1,$s2,2
add $t1,$t1,$s0
addi $s2,$s2,-1
sw $t0,0($t1)
bne $s2,$zero,loop

ori $s2,$zero,99

soma:
sll $t1,$s2,2
add $t1,$t1,$s0
addi $s2,$s2,-1
lw $t0,0($t1)
add $t2,$t2,$t0
bne $s2,$zero,soma

