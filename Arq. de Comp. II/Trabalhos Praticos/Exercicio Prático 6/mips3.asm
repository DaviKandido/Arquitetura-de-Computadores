# //programa 4 (add, addi, sub, lógicas)
# x = 3;
# y = 4;
# z = (15*x + 67*y)*4

#x -> $s0
#y -> $s1
#z -> $s2
.text

.globl main

main:
ori $s0,$zero,3	# x = 3;
ori $s1,$zero,4	# y = 4;
sll $t0,$s0,4 	# t0 = x*16;
sub $t0,$t0,$s0 	# t0 = x-3;
sll $t1,$s1,6 	# t1 = x*64;
add $t1,$t1,$s1 	# t1 = x+4;
add $t1,$t1,$s1 	# t1 = x+4;
add $t1,$t1,$s1 	# t1 = x+4;
add $t0,$t1,$t0	# t0 = (15*x + 67*y);
sll $s2,$t0,2 	# y = t0*4;