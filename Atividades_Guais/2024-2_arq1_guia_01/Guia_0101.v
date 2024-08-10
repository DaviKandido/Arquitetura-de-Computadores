/*
    -identificação: 

Guia_01 - 02 / 08 / 2024

Nome: Davi Cândido de Almeida
Matricula: 857859
Código de Pessoa: 1527368

*/

/*
    -Cabeçalho:
    
Guia_0101.v
857859 - Davi Cândido de Almeida
*/

module Guia_0101;
    // define data
    integer x = 365; // decimal
    reg [9:0] b = 0; // binary (bits - little endian)
    // actions
    initial
        begin : main
            $display ( "Guia_0101 - Tests" );
            $display ( "x = %d" , x );
            $display ( "b = %10b", b );
            b = x;
            $display ( "b = %10b", b );
        end // main
endmodule // Guia_0101

/*
    -Saídas de resultados:

Guia_0101 - Tests
x =          26  
b = 00000000     
b = 00011010 

Guia_0101 - Tests
x =          53
b = 00000000
b = 00110101


Guia_0101 - Tests
x =         713
b = 00000000
b = 11001001

Obs: Foi necessario o aumento de mais duas casas, ou seja: reg [9:0] e %10b 
Guia_0101 - Tests
x =         713
b = 0000000000
b = 1011001001

Guia_0101 - Tests
x =         213
b = 0000000000
b = 0011010101

Guia_0101 - Tests
x =         365
b = 0000000000
b = 0101101101
*/

/*
    -Notas:

Para compilar: iverilog -o Guia_0101.vvp Guia_0101.v
Para executar: vvp Guia_0101.vvp
*/

