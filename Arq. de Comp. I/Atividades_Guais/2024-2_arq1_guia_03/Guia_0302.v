/*
    -identificação: 

Guia_0302 - 15 / 08 / 2024

Nome: Davi Cândido de Almeida
Matricula: 857859
Código de Pessoa: 1527368

*/

module Guia_0302;
// define data
 reg [5:0] a = 8'b111001 ; //Base4 -> binary
 reg [7:0] b = 8'hb2 ;// hexadecimal
 reg [5:0] c = 8'b101101 ; // Base4 -> binary
 reg [9:0] d = 8'o146 ; // octal
 reg [7:0] e = 8'h6f ; // hexadecimal

 reg [5:0] aR = 0 ; // binary
 reg [7:0] bR = 0 ; // binary
 reg [5:0] cR = 0 ; // binary
 reg [9:0] dR = 0 ; // binary
 reg [7:0] eR = 0 ; // binary
// actions
 initial
 begin : main
 $display ( "Guia_0302 - Tests" );
 aR = ~a+1;
 $display ( "a = %8b -> C1(a) = %8b -> C2(a) = %8b", a, ~a, aR );
 bR = ~b+1;
 $display ( "b = %8b -> C1(b) = %8b -> C2(b) = %8b", b, ~b, bR );
 cR = ~c+1;
 $display ( "c = %8b -> C1(c) = %8b -> C2(c) = %8b", c, ~c, cR );
 dR = ~d+1;
 $display ( "d = %10b -> C1(c) = %10b -> C2(c) = %10b", d, ~d, dR );
 eR = ~e+1;
 $display ( "e = %8b -> C1(c) = %8b -> C2(c) = %8b", e, ~e, eR );
 end // main
endmodule // Guia_0302

/*
    -Saídas de resultados:

Guia_0302 - Tests
a =   111001 -> C1(a) =   000110 -> C2(a) =   000111
b = 10110010 -> C1(b) = 01001101 -> C2(b) = 01001110
c =   101101 -> C1(c) =   010010 -> C2(c) =   010011
d = 0001100110 -> C1(c) = 1110011001 -> C2(c) = 1110011010
e = 01101111 -> C1(c) = 10010000 -> C2(c) = 10010001 

//Saida com todas as respostas


*/

/*
    -Notas:

Para compilar: iverilog -o Guia_0302.vvp Guia_0302.v
Para executar: vvp Guia_0302.vvp
*/

