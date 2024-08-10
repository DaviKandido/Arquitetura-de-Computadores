/*
    -identificação: 

Guia_0205 - 08 / 08 / 2024

Nome: Davi Cândido de Almeida
Matricula: 857859
Código de Pessoa: 1527368

*/

module Guia_0205;
// define data
reg [7:0] a = 8'b01101011 ; // binary
reg [7:0] b = 8'b00001101 ; // binary
reg [7:0] c;
// actions
initial
begin : main
    $display ( "Guia_0205 - Tests" );
    $display ( "a = %8b", a );
    $display ( "b = %8b", b );
    c = a+b;
    $display ( "c = a+b = %8b", c );
    c = a-b;
    $display ( "c = a-b = %8b", c );
    c = b-a;
    $display ( "c = b-a = %8b", c );
    c = a*b;
    $display ( "c = a*b = %8b", c );
    c = a/b;
    $display ( "c = b/a = %8b", c );
    c = a%b;
    $display ( "c = b%%a = %8b", c );
end // main

endmodule // Guia_0205


/*
    -Saídas de resultados:

uia_0205 - Tests
a = 01011100
b = 00100110
c = a+b = 10000010 - Resultado pedida
c = a-b = 00110110
c = b-a = 11001010
c = a*b = 10101000
c = b/a = 00000000
c = b%a = 00100110

Guia_0205 - Tests
a = 10001010
b = 00100100
c = a+b = 10101110
c = a-b = 01100110 - Resultado pedida
c = b-a = 10011010
c = a*b = 01101000
c = b/a = 00000000
c = b%a = 00100100

//Foi necessario aumentar c para 12, reg [12:0] c

Guia_0205 - Tests
a = 01011010
b = 00101010
c = a+b = 0000010000100
c = a-b = 0000000110000
c = b-a = 1111111010000
c = a*b = 0111011000100 - Resultado pedida
c = b/a = 0000000000000
c = b%a = 0000000101010

Guia_0205 - Tests
a = 10111010
b = 00110110
c = a+b = 0000011110000
c = a-b = 0000010000100
c = b-a = 1111101111100
c = a*b = 0011100111100
c = b/a = 0000000000011 - Resultado pedida
c = b%a = 0000000110110 (Dizima da divisão)

Guia_0205 - Tests
a = 01101011
b = 00001101
c = a+b = 0000001111000
c = a-b = 0000001011110
c = b-a = 1111110100010
c = a*b = 0010101101111
c = b/a = 0000000001000
c = b%a = 0000000001101 - Resultado pedida

Guia_0205 - Tests
a = 01101011
b = 00001101
c = a+b = 01111000
c = a-b = 01011110
c = b-a = 10100010
c = a*b = 01101111
c = b/a = 00001000
c = b%a = 00000011
*/
/*
    -Notas:

Para compilar: iverilog -o Guia_0205.vvp Guia_0205.v
Para executar: vvp Guia_0205.vvp
*/

