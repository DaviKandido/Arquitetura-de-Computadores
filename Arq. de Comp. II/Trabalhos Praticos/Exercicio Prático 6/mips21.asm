#// programa 20

# x -> $s0
# y -> $s1

.data

x: .word -3
y: .word 0

.text

.globl main

main:

lui $s5, 0x1001
lw $s0,0($s5)

slt $t0,$zero,$s0,
beq $t0,$zero,menorIgual

ori $t1,$zero,3
ori $t2,$zero,1 # t2 = x³
loop3:
mult $t2,$s0
mflo $t2
addi $t1,$t1,-1
bne $t1,$zero,loop3

addi $s1,$t2,1
sw $s1,4($s5)

j fim
menorIgual:

ori $t1,$zero,4
ori $t2,$zero,1 # t2 = x²
loop2:
mult $t2,$s0
mflo $t2
addi $t1,$t1,-1
bne $t1,$zero,loop2

addi $s1,$t2,-1
sw $s1,4($s5)

fim: 


