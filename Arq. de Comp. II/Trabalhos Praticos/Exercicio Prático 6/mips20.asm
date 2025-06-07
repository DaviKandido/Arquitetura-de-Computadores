#// programa 20

# x -> $s0
# y -> $s1

.data

x: .word 3
y: .word 0

.text

.globl main

main:

lui $s5, 0x1001
lw $s0,0($s5)
and $t0,$s0,1

bne $t0,$zero,impar

ori $t1,$zero,4
ori $t2,$zero,1 # t2 = x⁴
loop4:
mult $t2,$s0
mflo $t2
addi $t1,$t1,-1
bne $t1,$zero,loop4

ori $t1,$zero,3
ori $t3,$zero,1 # t3 = x³
loop3:
mult $t3,$s0
mflo $t3
addi $t1,$t1,-1
bne $t1,$zero,loop3

ori $t1,$zero,2
ori $t4,$zero,1 # t4 = x²
loop2:
mult $t4,$s0
mflo $t4
addi $t1,$t1,-1
bne $t1,$zero,loop2
ori $t5,$zero,-2
mult $t4,$t5
mflo $t4

add $t2,$t2,$t3
add $s1,$t2,$t4
sw $s1,4($s5)

fim: j fim
impar:

ori $t1,$zero,5
ori $t2,$zero,1 # t2 = x⁵
loop5:
mult $t2,$s0
mflo $t2
addi $t1,$t1,-1
bne $t1,$zero,loop5

ori $t1,$zero,3
ori $t3,$zero,1 # t3 = x³
loopn3:
mult $t3,$s0
mflo $t3
addi $t1,$t1,-1
bne $t1,$zero,loopn3
not $t3,$t3
addi $t3,$t3,1


add $t2,$t2,$t3
addi $s1,$t2,1
sw $s1,4($s5)



