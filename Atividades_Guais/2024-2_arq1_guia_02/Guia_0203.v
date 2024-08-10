/*
    -identificação: 

Guia_0203 - 08 / 08 / 2024

Nome: Davi Cândido de Almeida
Matricula: 857859
Código de Pessoa: 1527368

*/

module Guia_0203;
// define data
real x = 1010; // decimal
reg [7:0] b = 8'b10010000; // binary
// actions
initial
begin : main
$display ( "Guia_0203 - Tests" );
$display ( "x = %f" , x );
$display ( "b = 0.%8b", b );
$display ( "b = d.%x%x (16)", b[7:4],b[3:0] );
$display ( "b = 0.%o%o%o (8) ", b[7:5],b[4:2],b[1:0] );

// Foi necessario a adção para a visualização na base 4
$display ( "b = 0.%d%d%d%d (4) ", b[7:6],b[5:4],b[3:2], b[1:0] );
end // main
endmodule // Guia_0203


/*
    -Saídas de resultados:

Guia_0203 - Tests
x = 0.000000
b = 0.00011110
b = 0.1e (16)
b = 0.X36 (8) 
b = 0.132 (4) - Base pedida

Guia_0203 - Tests
x = 0.000000
b = 0.10100100
b = 0.a4 (16)
b = 0.510 (8)  - Base pedida
b = 0.2210 (4)

Guia_0203 - Tests
x = 0.000000
b = 0.10011000
b = 0.98 (16) - Base pedida
b = 0.230 (8) 
b = 0.2120 (4) 

Guia_0203 - Tests
x = 0.000000
b = 0.11101100
b = 0.ec (16)
b = 1.730 (8)   Base pedida
b = 0.3230 (4)

Guia_0203 - Tests
x = 1010.000000
b = 0.10010000
b = d.90 (16)  - Base pedida
b = 0.440 (8) 
b = 0.2100 (4) 


*/
/*
    -Notas:

Para compilar: iverilog -o Guia_0203.vvp Guia_0203.v
Para executar: vvp Guia_0203.vvp
*/

