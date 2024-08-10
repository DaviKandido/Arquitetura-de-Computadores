# Modelo em Python
'''
    -identificação: 

Guia_0101 - 02 / 08 / 2024

Nome: Davi Cândido de Almeida
Matricula: 857859
 Código de Pessoa: 1527368
'''
'''
Contador de erros.
'''
errors = 0
'''
Testar se dois valores sao iguais.
@param x - primeiro valor
@param y - segundo valor
'''
def test_equals ( x, y ):
    global errors
    if ( str(x) != str(y) ):
        errors = errors + 1
# end test_equals ( )
'''
Exibir o total de erros.
@return mensagem com o total de erros
'''
def test_report ( ):
    return ( ""+str(errors) )
# end test_report ( )
'''
Converter valor decimal para binário.
@return binário equivalente
@param value - valor decimal
'''
def dec2bin ( x ):
    
    bin = ''
    while x > 0:
        bin = str(x % 2) + bin
        x = x // 2 
    return int(bin)

# end dec2bin ( )
'''
Converter valor binário para decimal.
@return decimal equivalente
@param value - valor binário
'''
def bin2dec ( value ):

    i = len(value) - 1
    dec = 0
    while(i >= 0):
        dec += int(value[len(value)- i - 1])*pow(2,i)
        i -= 1
        
    return dec
    
# end bin2dec ( )
'''
Converter valor decimal para base indicada.
@return base para a conversão
@param value - valor decimal
'''
def dec2base ( value, base ):

    if base < 10:
        if value <= 0:
            return '0'
        result = ''
        while value > 0:
            result = str(value % base) + result
            value = value // base 
        return int(result)
    else:

        result  = ''
        while value > 0:
            x_teste  = value % base

            if x_teste > 9:
                result = chr(ord('A') + (x_teste - 10)) + result 
            else:
                result  = str(value % base) + result 

            value = value // base
        return result

# end dec2base ( )
'''
Converter valor binário para base indicada.
@return valor equivalente na base indicada
@param value - valor binário
@param base - para a conversão
'''
def bin2base ( value, base ):

    result1 = bin2dec(value)
    result2 = dec2base(result1, base)

    return ( result2 )
# end bin2base ( )
'''
Converter valor em ASCII para hexadecimal.
@return hexadecimal equivalente
@param value - caractere(s) em código ASCII
'''
def ASCII2hex ( value ):

    result = ""
    i = 0

    while i < len(value):

        num = hex(ord(value[i]))
        result = result + num
        i += 1

    return ( result )
# end ASCII2hex ( )
'''
Converter valor em ASCII para binario.
@return binário equivalente
@param value - caractere(s)
'''
def ASCII2bin ( value ):

    result = ""
    i = 0

    while i < len(value):

        num = bin(ord(value[i]))
        result = result + num
        i += 1

    return ( result )
# end ASCII2hex ( )

'''
Converter valor em Octal para ASCII.
@return caractere(s) em código ASCII
@param value - Octal equivalente(s)
'''
def Oct2ASCII ( value_string ):
        
    value_numbers = value_string.split() #O splint() Separa cada octal presente na string
    Result = ''
    for value in value_numbers: #Foreach em python
        
        decimal = int(value, 8)
        char = chr(decimal)
        
        Result += char
    return Result

'''
Converter valor em hexadecimal para ASCII.
@return caractere(s) em código ASCII
@param value - hexadecimal equivalente(s)
'''
def hex2ASCII ( value_string ):
        
    
    value_numbers = value_string.split()
    Result = ''
    for value in value_numbers: 
        
        decimal = int(value, 16)
        char = chr(decimal)
        
        Result += char
    return Result


# end hex2ASCII ( )
'''
Ação principal.
'''
def main ( ):
    print ( "Guia_01 - Python Tests" )
    print ( "857859 - Davi Cândido de Almeida" )
    print ( )
    test_equals ( dec2bin ( 26 ), "11010" )
    test_equals ( dec2bin ( 53 ), "110101" )
    test_equals ( dec2bin ( 713 ), "1011001001" )
    test_equals ( dec2bin ( 213 ), "11010101" )
    test_equals ( dec2bin ( 365 ), "101101101" )
    print ( "1. errorTotalReport = "+test_report ( ) )
    test_equals ( bin2dec ( "10101" ), 21 )
    test_equals ( bin2dec ( "11011" ), 27 )
    test_equals ( bin2dec ( "10010" ), 18 )
    test_equals ( bin2dec ( "101011" ), 43 )
    test_equals ( bin2dec ( "110111" ), 55 )
    print ( "2. errorTotalReport = "+test_report ( ) )
    test_equals ( dec2base ( 61, 4 ), "331" )
    test_equals ( dec2base ( 53, 8 ), "65" )
    test_equals ( dec2base ( 77, 16 ), "4D" )
    test_equals ( dec2base ( 153, 16 ), "99" )
    test_equals ( dec2base ( 753, 16 ), "2F1" )
    print ( "3. errorTotalReport = "+test_report ( ) )
    test_equals ( bin2base ( "10100", 4 ), "110" )
    test_equals ( bin2base ( "11010", 8 ), "32" )
    test_equals ( bin2base ( "100111", 16 ), "27" )
    test_equals ( bin2base ( "100101", 8 ), "45" )
    test_equals ( bin2base ( "101101", 4 ), "231" )
    print ( "4. errorTotalReport = "+test_report ( ) )
    test_equals ( ASCII2hex ( "PUC-M.G." ), "0x500x550x430x2d0x4d0x2e0x470x2e" )
    test_equals ( ASCII2hex ( "2024-02" ), "0x320x300x320x340x2d0x300x32" )
    #No exercício passado foi solicitado para ser feito a conversão ASCII de forma binaria, foi necessário a criação de uma função nova para isso ASCII2bin()
    test_equals ( ASCII2bin ( "BeloHorizonte" ), "0b10000100b11001010b11011000b11011110b10010000b11011110b11100100b11010010b11110100b11011110b11011100b11101000b1100101" )
    # OBS.: A seguir, exemplos apenas para os primeiros, acrescentar todos os outros códigos propostos!
    test_equals ( Oct2ASCII ( "0o156 0o157 0o151 0o164 0o145" ), "noite" ) # OBS.: 156 e' o primeiro octal (0o156)!
    #Foi necessário a criação da função Oct2ASCII(), pois a função hex2ASCII so tratava hexadecimais
    test_equals ( hex2ASCII ( "0x4D 0x61 0x6E 0x68 0x61" ), "Manha" ) # OBS.: 4D e' o primeiro hexadecimal (0x4D)!

    print ( "5. errorTotalReport = "+test_report( ) )
    print ( "\n\nApertar ENTER para terminar." )
    input ( )
    # end main ( )
    
if __name__ == "__main__":
    main( )