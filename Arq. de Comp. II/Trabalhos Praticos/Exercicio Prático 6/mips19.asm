# // programa 19
# Escrever um programa que leia dois números da memória, a primeira e segunda posições
# respectivamente (os coloque em $s0 e $s1) e determine a quantidade de bits significantes de cada
# um. Coloque as respostas em $t0 e $t1, a partir desse resultado faça a multiplicação. Caso o número
# de bits significantes de ambos seja menor do que 32 a resposta deverá estar apenas em $s2, caso
# contrário a resposta estará em $s2 e $s3 (LO e HI respectivamente).

.data

x: .word 65535
y: .word 13107

.text

.globl main

main:

lui $s5, 0x1001
lui $s4, 0x7000
lw $s0,0($s5)
lw $s1,4($s5)
mult $s0,$s1

or $t3,$zero,$s0
or $t5,$zero,$s1
cont1:
ori $t4,$t3,0
beq $t4,$zero,cont2
srl $t3,$t3,1
add $t0,$t0,1
j cont1

cont2:
ori $t4,$t5,0
beq $t4,$zero,continua
srl $t5,$t5,1
add $t1,$t1,1
j cont1

continua:
add $t7,$t0,$t1
ori $s4,$zero,32
slt $t2,$t7,$s4
bne $t2,$zero, menor
mfhi $s3

menor:
mflo $s2




