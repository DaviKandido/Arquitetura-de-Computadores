# //programa 2 (add, addi, sub, lógicas)
# x = 1;
# y = 5*x + 15;

#x -> $s0
#y -> $s1
.text

.globl main

main:
ori $s0,$zero,1 # x =2;
sll $t0,$s0,2 # x = x*4
add $t0,$t0,$s0 # x = x + 1
addi $s1,$t0,15 # x = x + 15