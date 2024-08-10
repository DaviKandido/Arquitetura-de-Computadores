"""'
    -identificação: 

Guia_0103 - 02 / 08 / 2024

Nome: Davi Cândido de Almeida
Matricula: 857859
 Código de Pessoa: 1527368

"""

def dec_2(x):
    if x == 0:
        return '0'
    bin = ''
    while x > 0:
        bin = str(x % 2) + bin
        x = x // 2 
    return int(bin)

def dec_4(x):
    if x == 0:
        return '0'
    x_4 = ''
    while x > 0:
        x_4 = str(x % 4) + x_4
        x = x // 4 
    return int(x_4)

def dec_8(x):
    if x == 0:
        return '0'
    dec_8 = ''
    while x > 0:
        dec_8 = str(x % 8) + dec_8
        x = x // 8
    return int(dec_8)

def dec_16(x):
    if x == 0:
        return '0'
    x_16  = ''
    while x > 0:
        x_teste  = x % 16

        if x_teste > 9:
            x_16 = chr(ord('A') + (x_teste - 10)) + x_16 
        else:
            x_16  = str(x % 16) + x_16 

        x = x // 16 
    return x_16

print("Guia_0103 - Tests")

x = int(input("Insira valor a ser visto em cada base: "))
print(f'x = {x}')

x_2 = dec_2(x)
x_4 = dec_4(x)
x_8 = dec_8(x)
x_16 = dec_16(x)

print(f'x(10) = {x_2}(2) {x_4}(4) {x_8}(8) {x_16}(16)')


"""
    -Saídas de resultados:

Guia_0103 - Tests
Insira valor a ser visto em cada base: 61
x = 61
x(10) = 111101(2) 331(4) 75(8) 313(16)

Guia_0103 - Tests
Insira valor a ser visto em cada base: 53
x = 53
x(10) = 110101(2) 311(4) 65(8) 35(16)

Guia_0103 - Tests
Insira valor a ser visto em cada base: 77
x = 77
x(10) = 1001101(2) 1031(4) 115(8) 4D(16)

Guia_0103 - Tests
Insira valor a ser visto em cada base: 153
x = 153
x(10) = 10011001(2) 2121(4) 231(8) 99(16)

Guia_0103 - Tests
Insira valor a ser visto em cada base: 753
x = 753
x(10) = 1011110001(2) 23301(4) 1361(8) 2F1(16)
*/

"""
