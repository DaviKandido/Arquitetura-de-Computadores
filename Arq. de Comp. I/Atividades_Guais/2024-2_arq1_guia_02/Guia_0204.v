/*
    -identificação: 

Guia_0204 - 08 / 08 / 2024

Nome: Davi Cândido de Almeida
Matricula: 857859
Código de Pessoa: 1527368

*/

module Guia_0204;
// define data
real x = 0.0; // decimal
reg [11:0] b = 12'b101001011110 ; // binary
integer q [5:0];
// actions
initial
begin : main
$display ( "Guia_0204 - Tests" );
$display ( "x = %f" , x );
$display ( "b = 0.%8b", b );
$display ( "b = 0.%x%x%x  (16)", b[11:8], b[7:4],b[3:0] );
q[5] = b[11:10];
q[4] = b[9:8];
q[3] = b[7:6];
q[2] = b[5:4];
q[1] = b[3:2];
q[0] = b[1:0];
$display ( "b = 0.%2b %2b %2b %2b %2b %2b (2)",b[11:10], b[9:8], b[7:6],b[5:4],b[3:2],b[1:0] );
$display ( "q = 0.%2d %2d %2d %2d %2d %2d (4)", q[5] ,q[4] ,q[3] ,q[2] ,q[1] ,q[0] );
end // main
endmodule // Guia_0204


/*
    -Saídas de resultados:

Guia_0204 - Tests
x = 0.321000
b = 0.11100100
b = 0.321 (4)
b = 0.11 10 01 00 (2) - Base pedida
q = 0. 3  2  1  0 (4)

Guia_0204 - Tests
x = 0.000000
b = 0.001111010010
b = 0.3d2  (16)
b = 0.00 11 11 01 00 10 (2)
q = 0. 0  3  3  1  0  2 (4) - Base pedida

x = 0.751000
b = 0.111101001000
b = 0.751  (8)
b = 0.11 11 01 00 10 00 (2) - Base pedida
q = 0. 3  3  1  0  2  0 (4)

Guia_0204 - Tests
x = 7.345000
b = 0.011100101000
b = 0.345  (8)
b = 0.01 11 00 10 10 00 (2)
q = 0. 1  3  0  2  2  0 (4) - Base pedida

Guia_0204 - Tests
x = 0.000000
b = 0.101001011110
b = 0.a5e  (16)
b = 0.10 10 01 01 11 10 (2)
q = 0. 2  2  1  1  3  2 (4) - Base pedida

*/
/*
    -Notas:

Para compilar: iverilog -o Guia_0204.vvp Guia_0204.v
Para executar: vvp Guia_0204.vvp
*/

