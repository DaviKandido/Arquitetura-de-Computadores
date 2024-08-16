/*
    -identificação: 

Guia_0303 - 15 / 08 / 2024

Nome: Davi Cândido de Almeida
Matricula: 857859
Código de Pessoa: 1527368

*/

module Guia_0303;
// define data
 reg signed [4:0] a = 8'b10110; // binary
 reg signed [5:0] b = 8'b110011 ; // binary
 reg signed [5:0] c = 8'b100100 ; // binary
 reg signed [6:0] d = 8'b1011011 ; // binary
 reg signed [6:0] e = 8'b1110011 ; // binary

 reg signed [7:0] R = 0 ; // binary
 reg signed [6:0] r = 0 ; // binary
// actions
 initial
 begin : main
 $display ( "Guia_0303 - Tests" );
 R = ~a+1;
 r = ~(a-1);
 $display ( "a = %8b -> C1(a) = %8b -> C2(a) = %8b = %d = %d", a, ~a, R, R, r );
 R = ~b+1;
 r = ~(b-1);
 $display ( "b = %7b -> C1(b) = %7b -> C2(b) = %7b = %d = %d", b, ~b, R, R, r );
 R = ~c+1;
 r = ~(c-1);
 $display ( "c = %6b -> C1(c) = %6b -> C2(c) = %6b = %d = %d", c, ~c, R, R, r );
 R = ~d+1;
 r = ~(d-1);
 $display ( "c = %6b -> C1(c) = %6b -> C2(c) = %6b = %d = %d", d, ~d, R, R, r );
 R = ~e+1;
 r = ~(e-1);
 $display ( "c = %6b -> C1(c) = %6b -> C2(c) = %6b = %d = %d = %h(16)", e, ~e, R, R, r, r );
 end // main end // main
endmodule // Guia_0303

/*
    -Saídas de resultados:

Guia_0303 - Tests
a =    10110 -> C1(a) =    01001 -> C2(a) = 00001010 =   10 =  10
b =  110011 -> C1(b) =  001100 -> C2(b) = 00001101 =   13 =  13
c = 100100 -> C1(c) = 011011 -> C2(c) = 00011100 =   28 =  28
c = 1011011 -> C1(c) = 0100100 -> C2(c) = 00100101 =   37 =  37
c = 1110011 -> C1(c) = 0001100 -> C2(c) = 00001101 =   13 =  13 = 0d(16)

//Saida com todas as respostas


*/

/*
    -Notas:

Para compilar: iverilog -o Guia_0303.vvp Guia_0303.v
Para executar: vvp Guia_0303.vvp
*/

