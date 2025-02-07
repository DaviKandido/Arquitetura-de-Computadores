/*
    -identificação: 

Guia_01 - 02 / 08 / 2024

Nome: Davi Cândido de Almeida
Matricula: 857859
Código de Pessoa: 1527368

*/

/*
    -Cabeçalho:
    
Guia_0102.v
857859 - Davi Cândido de Almeida
*/

module Guia_0102;
// define data
integer x = 0; // decimal
reg [7:0] b = 8'b0110111; // binary (bits - little endian)
// actions
initial
begin : main
$display ( "Guia_0102 - Tests" );
$display ( "x = %d" , x );
$display ( "b = %8b", b );
x = b;
$display ( "b = %d", x );
end // main
endmodule // Guia_0102

/*
    -Saídas de resultados:

Guia_0102 - Tests
x =           0  
b = 00010101     
b =          21

Guia_0102 - Tests
x =           0
b = 00011011
b =          27

Guia_0102 - Tests
x =           0  
b = 00010010     
b =          18 

Guia_0102 - Tests
x =           0
b = 00101011
b =          43

Guia_0102 - Tests
x =           0
b = 00110111
b =          55

*/

/*
    -Notas:

Para compilar: iverilog -o Guia_0102.vvp Guia_0102.v
Para executar: vvp Guia_0102.vvp
*/

