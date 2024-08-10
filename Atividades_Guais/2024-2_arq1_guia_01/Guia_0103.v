/*
    -identificação: 

Guia_0103 - 02 / 08 / 2024

Nome: Davi Cândido de Almeida
Matricula: 857859
Código de Pessoa: 1527368

*/

/*
    -Cabeçalho:
    
Guia_0103.v
857859 - Davi Cândido de Almeida
*/

module Guia_0103;
// define data
integer x = 753; // decimal
reg [10:0] b = 0; // binary
// actions
initial
begin : main
$display ( "Guia_0103 - Tests" );
$display ( "x = %d" , x );
$display ( "b = %10b", b );
b = x;
$display ( "b = %B (2) = %o (8) = %x (16) = %X (16) ", b, b, b, b );
end // main
endmodule // Guia_0103

/*
    -Saídas de resultados:

Guia_0103 - Tests
x =          53
b = 00000000
b = 00110101 (2) = 065 (8) = 35 (16) = 35 (16)

Guia_0103 - Tests
x =          77
b = 00000000
b = 01001101 (2) = 115 (8) = 4d (16) = 4d (16) 

Guia_0103 - Tests
x =         153
b = 00000000
b = 10011001 (2) = 231 (8) = 99 (16) = 99 (16)

Obs: Foi necessario o aumento de mais duas casas (10 bits), ou seja: reg [10:0] e %10b 
Guia_0103 - Tests
x =         753
b = 00000000000
b = 01011110001 (2) = 1361 (8) = 2f1 (16) = 2f1 (16)

*/

/*
    -Notas:

Para compilar: iverilog -o Guia_0103.vvp Guia_0103.v
Para executar: vvp Guia_0103.vvp
*/

