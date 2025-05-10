# Exercicio programa 7
# x -> $s0 (maior possivel 0x7FFFFFFF)
# y -> $s1 (y = 3000000)
# z -> $s2 (x-4y)
.text
.globl main

main:
ori $s0, $zero, 0x01
sll $s0, $s0, 31
sra $s0, $s0, 31