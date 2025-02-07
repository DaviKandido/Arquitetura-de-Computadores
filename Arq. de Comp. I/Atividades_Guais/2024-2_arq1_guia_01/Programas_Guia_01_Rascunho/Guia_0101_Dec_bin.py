"""'
    -identificação: 

Guia_0101 - 02 / 08 / 2024

Nome: Davi Cândido de Almeida
Matricula: 857859
 Código de Pessoa: 1527368

"""

def dec2bin(x):
    if x == 0:
        return '0'
    bin = ''
    while x > 0:
        bin = str(x % 2) + bin
        x = x // 2 
    return int(bin)


print("Guia_0101 - Tests")

x = int(input("Insira valor a ser visto em binário: "))
print(f'x = {x}')

#x_bin = bin(x)[2:] //Poderia também ser feito assim
x_bin = dec2bin(x)

print(f'bin(x) = {x_bin}')


"""
    -Saídas de resultados:

Guia_0101 - Tests
Insira valor a ser visto em binário: 26
x = 26        
bin(x) = 11010

Guia_0101 - Tests
Insira valor a ser visto em binário: 53
x = 53
bin(x) = 110101

Guia_0101 - Tests
Insira valor a ser visto em binário: 713
x = 713
bin(x) = 1011001001

Guia_0101 - Tests
Insira valor a ser visto em binário: 213
x = 213
bin(x) = 11010101

Guia_0101 - Tests
Insira valor a ser visto em binário: 365
x = 365
bin(x) = 101101101
*/

"""
