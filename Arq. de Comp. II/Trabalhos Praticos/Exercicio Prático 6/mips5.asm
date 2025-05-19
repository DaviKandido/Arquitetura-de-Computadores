# Exercicio programa 8
# $8 = 0x12345678.
#$9 = 0x12
#$10 = 0x34
#$11 = 0x56
#$12 = 0x78

# Associação:
# $s0 -> 0x12345678
# $s1 -> 0x12
# $s2 -> 0x34
# $s3 -> 0x56
# $s4 -> 0x78

.text
.globl main

main:
lui $s0, 0x1234
ori $s0, $s0, 0x5678
srl $t0, $s0,24
andi $s1,$t0, 0x00FF
srl $t0, $s0,16
andi $s2,$t0, 0x00FF
srl $t0, $s0,8
andi $s3,$t0, 0x00FF
andi $s4,$s0, 0x00FF



