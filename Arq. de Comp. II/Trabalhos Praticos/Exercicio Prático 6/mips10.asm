#// programa 10
#Considere o seguinte programa: y = 127x – 65z + 1
#Faça um programa que calcule o valor de y conhecendo os valores de x e z. Os valores de x e z
#estão armazenados na memória e, na posição imediatamente a seguir, o valor de y deverá ser
#escrito, ou seja:
#.data
#x: .word 5
#z: .word 7
#y: .word 0 # esse valor deverá ser sobrescrito após a execução do program

#Associações:
# x -> $s0
# y -> $s1
# z -> $s2

.data
x: .word 5
z: .word 7
y: .word 0 # esse valor deverá ser sobrescrito após a execução do programa


.text

.globl main

main:
lui $t0,0x1001
lw $s0,0($t0)
lw $s1,4($t0)
lw $s2,8($t0)

sll $t1,$s0,7
sub $t1,$t1,$s0

sll $t2,$s1,6
add $t2,$t2,$s1

sub $t1,$t1,$t2
addi $s2,$t1,1
sw $s2,8($t0)
