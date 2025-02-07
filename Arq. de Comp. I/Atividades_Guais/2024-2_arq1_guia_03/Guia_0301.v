/*
    -identificação: 

Guia_0301 - 15 / 08 / 2024

Nome: Davi Cândido de Almeida
Matricula: 857859
Código de Pessoa: 1527368

*/


module Guia_0301;
// define data
 reg [5:0] a = 8'b1010 ; // binary
 reg [7:0] b = 8'b1101 ; // binary
 reg [5:0] c = 8'b101001 ; // binary
 reg [6:0] d = 8'b101111 ; // binary
 reg [7:0] e = 8'b110100 ; // binary

 reg [5:0] aR = 0 ; // binary
 reg [7:0] bR = 0 ; // binary
 reg [5:0] cR = 0 ; // binary
 reg [6:0] dR = 0 ; // binary
 reg [7:0] eR = 0 ; // binary
// actions
 initial
 begin : main
 $display ( "Guia_0301 - Tests" );
 aR = ~a+1;
 $display ( "a = %8b -> C1(a) = %8b -> C2(a) = %8b", a, ~a, aR );
 bR = ~b+1;
 $display ( "b = %8b -> C1(b) = %8b -> C2(b) = %8b", b, ~b, bR );
 cR = ~c+1;
 $display ( "c = %8b -> C1(c) = %8b -> C2(c) = %8b", c, ~c, cR );
 dR = ~d+1;
 $display ( "d = %8b -> C1(c) = %8b -> C2(c) = %8b", d, ~d, dR );
 eR = ~e+1;
 $display ( "e = %8b -> C1(c) = %8b -> C2(c) = %8b", e, ~e, eR );
 end // main
endmodule // Guia_0301

/*
    -Saídas de resultados:

Guia_0301 - Tests
a =   001010 -> C1(a) =   110101 -> C2(a) =   110110
b = 00001101 -> C1(b) = 11110010 -> C2(b) = 11110011
c =   101001 -> C1(c) =   010110 -> C2(c) =   010111
d =  0101111 -> C1(c) =  1010000 -> C2(c) =  1010001
e = 00110100 -> C1(c) = 11001011 -> C2(c) = 11001100

//Saida com todas as respostas


*/

/*
    -Notas:

Para compilar: iverilog -o Guia_0301.vvp Guia_0301.v
Para executar: vvp Guia_0301.vvp
*/

