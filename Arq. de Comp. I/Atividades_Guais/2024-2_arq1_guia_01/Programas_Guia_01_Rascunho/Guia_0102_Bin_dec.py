"""'
    -identificação: 

Guia_0102 - 02 / 08 / 2024

Nome: Davi Cândido de Almeida
Matricula: 857859
 Código de Pessoa: 1527368

"""

def dec2bin(x_bin):

    i = len(x_bin) - 1
    dec = 0
    while(i >= 0):
        dec += int(x_bin[len(x_bin)- i - 1])*pow(2,i)
        i -= 1
        
    return dec


print("Guia_0102 - Tests")

x_bin = input("Insira valor binário para ser convertido em decimal: ")
print(f'bin(x) = {x_bin}')

# x = int(x_bin, 2) //Poderia também ser feito assim
x = dec2bin(x_bin)


print(f'x = {x}')


"""
    -Saídas de resultados:

Guia_0102 - Tests
Insira valor binário para ser convertido em decimal: 10101
bin(x) = 10101
x = 21

Guia_0102 - Tests
Insira valor binário para ser convertido em decimal: 11011
bin(x) = 11011
x = 27 

Guia_0102 - Tests
Insira valor binário para ser convertido em decimal: 10010
bin(x) = 10010
x = 18

Guia_0102 - Tests
Insira valor binário para ser convertido em decimal: 101011
bin(x) = 101011
x = 43

Guia_0102 - Tests
Insira valor binário para ser convertido em decimal: 110111
bin(x) = 110111
x = 55
*/

"""
