
# 0X10010000 -> S$0
# i -> $s1
# j -> $s2


.text
.globl main

main:
 lui $s0,0x1001
 ori $s1,$zero,30
do:
 addi $s1,$s1,-1
 sll $t0,$s1,2
 add $t0,$t0,$s0
 sw $s1,0($t0)
 bne $s1,$zero,do
 ori $s1,$zero,10
 
sll $t0,$s1,2
add $t0,$t0,$s0
lw $s2,0($t0) 
add $a0,$zero,$s2
addi $sp,$sp,-4
sw $t0,4($sp)

jal soma1
lw $t0,4($sp)
addi $sp,$sp,4
add $s2,$zero,$v0
sw $s2,0($t0)

Fim: j Fim

soma1:
addi $sp,$sp,-4
sw $s0,4($sp)
sll $t0,$a0,1
addi $s0,$t0,1
add $v0,$s0,$zero
lw $s0,4($sp)
addi $sp,$sp,4
jr $ra

