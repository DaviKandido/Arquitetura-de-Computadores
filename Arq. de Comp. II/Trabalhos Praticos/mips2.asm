.text

 # $S0 -> X
 # $S1 -> Y
 # $S2 -> Z

.globl main

main:
#ori $t0,$t0, 0x1001
#sll $t0, $t0, 16
lui $t0, 0x1001
lw $s0, 0($t0) # x = 3
lw $s1, 4($t0) # y = 5
add $s2,$s0,$s1 # $s2 = x + y
sw $s2, 8($t0) # z = $s2

.data
x: .word 3 # $S0 -> X
y: .word 5 # $S1 -> Y
z: .word 7 # $S2 -> Z

