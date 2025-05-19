# Exercicio programa 4
# x -> $s0
# y -> $s1
# z -> $s2
.text
.globl main

main:
ori $s0,$zero,3
ori $s1,$zero,4
sll $t0, $s0, 4 # t=16x
sub $t0,$t0,$s0 # t0=16x-x 

sll $t1,$s1,6
add $t1,$t1,$s1
add $t1,$t1,$s1
add $t1,$t1,$s1
add $t0,$t0,$t1
sll $s2,$t0, 2
