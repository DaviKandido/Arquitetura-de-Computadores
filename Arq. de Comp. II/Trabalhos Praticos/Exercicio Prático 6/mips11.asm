#// programa 11
#Considere o seguinte programa: y = x – z + 300000
#Faça um programa que calcule o valor de y conhecendo os valores de x e z. Os valores de x e z
#estão armazenados na memória e, na posição imediatamente a seguir, o valor de y deverá ser
#escrito, ou seja:
#.data
#x: .word 100000
#z: .word 200000
#y: .word 0 # esse valor deverá ser sobrescrito após a execução do programa

#Associações:
# x -> $s0
# y -> $s1
# z -> $s2

.data
x: .word 100000
z: .word 200000
y: .word 0 # esse valor deverá ser sobrescrito após a execução do programa

.text

.globl main

main:
lui $t0,0x1001
lw $s0,0($t0)
lw $s1,4($t0)
lw $s2,8($t0)

sub $t1,$s0,$s1
add $t2,$zero,0x493E
sll $t2,$t2,4
add $s2,$t1,$t2
sw $s2,8($t0)
