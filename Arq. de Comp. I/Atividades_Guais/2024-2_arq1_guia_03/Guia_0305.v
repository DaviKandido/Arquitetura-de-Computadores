/*
    -identificação: 

Guia_0305 - 15 / 08 / 2024

Nome: Davi Cândido de Almeida
Matricula: 857859
Código de Pessoa: 1527368

*/
module Guia_0305;
// define data
 reg [5:0] a1 = 8'b110101; // binary
 reg [3:0] a2 = 8'b1011; // binary

 reg [6:0] b1 = 7'b 101_1001; // 101.1001(2) -> 5.5625 em decimal
 reg [6:0] b2 = 7'b011_0010; // 11.01(2) -> 3,1 em decimal

 reg [5:0] c1 = 6'b10_0111; // 10 01 11(2) -> 213(4)
 reg [7:0] c2 = 8'b0011_1101; // 0011 1101(2) -> 3d(16)

 reg [7:0] d1 = 8'b1100_0101; // 1100 0101(2) -> 3d(16)
 reg [6:0] d2 = 7'b101_1001; // 1011001(2)

 reg [7:0] e1 = 8'b0111_1110; // 0111 1110(2) -> 7e(16)
 reg [7:0] e2 = 8'b0010_1101; // 0010 1101(2) -> 2d(16)

 reg signed [6:0] Ra = 0; // binary
 reg signed [6:0] Rb = 0; // binary
 reg signed [6:0] Rc = 0; // binary
 reg signed [7:0] Rd = 0; // binary
 reg signed [7:0] Re = 0; // binary

// actions
 initial
 begin : main
 $display ( "Guia_0305 - Tests" );

 $display ( "a1 = %8b = %d", a1, a1 );
 $display ( "a2 = %8b = %d", a2, a2 );
 Ra = a1 - a2;
 $display ( "R = a1+a2 = %6b-%4b = %8b = %d = %o(8)\n", a1, a2, Ra, Ra,Ra );

 // Para b1 e b2, os últimos 4 bits são parte fracionária
 $display("b1 = %b (Parte inteira: %d, Parte fracionária: %0.4f)", b1, b1[6:4], b1[3:0] * 1.0 / 16);
 $display("b2 = %b (Parte inteira: %d, Parte fracionária: %0.4f)", b2, b2[6:4], b2[3:0] * 1.0 / 16);
    
    Rb = b1 - b2;
    $display("R = b1 - b2 = %b - %b = %b.%b => %f(10) = %o(8)\n", b1, b2, Rb[6:4], Rb[3:0], (Rb[6:4] + Rb[3:0] * 1.0 / 16), (Rb[6:4] + Rb[3:0] * 1.0 / 16));
    
 $display ( "c1 = %8b = %d", c1, c1 );
 $display ( "c2 = %8b = %d", c2, c2 );
 Rc = c1 - c2;
 $display ( "R = c1-c2 = %6b-%6b = %6b = %d(10) = -%o(8)\n", c1, c2, Rc, Rc, Rc );

 $display ( "d1 = %10b = %d", d1, d1 );
 $display ( "d2 = %10b = %d", d2, d2 );
 Rd = d1 - d2;
 $display ( "R = d1-d2 = %10b-%10b = %10b = %d(10) = %o(8) \n", d1, d2, Rd, Rd, Rd );

 $display ( "e1 = %13b = %d", e1, e1 );
 $display ( "e2 = %13b = %d", e2, e2 );
 Re = e1 - e2;
 $display ( "R = e1-e2 = %b-%b = %b = %d(10) = %o(8)\n", e1, e2, Re, Re, Re );

 end // main
endmodule // Guia_0305


/*
    -Saídas de resultados:

Guia_0305 - Tests
a1 =   110101 = 53
a2 =     1011 = 11
R = a1+a2 = 110101-1011 =  0101010 =  42 = 052(8)

b1 = 1011001 (Parte inteira: 5, Parte fracionária: 0.5625)
b2 = 0110010 (Parte inteira: 3, Parte fracionária: 0.1250)
R = b1 - b2 = 1011001 - 0110010 = 010.0111 => 2.437500(10) = 2(8)

c1 =   100111 = 39
c2 = 00111101 =  61
R = c1-c2 = 100111-00111101 = 1101010 = -22(10) = -152(8)

d1 =   11000101 = 197
d2 =    1011001 =  89
R = d1-d2 =   11000101-   1011001 =   01101100 =  108(10) = 154(8) 

e1 =      01111110 = 126
e2 =      00101101 =  45
R = e1-e2 = 01111110-00101101 = 01010001 =   81(10) = 121(8)

//Saida com todas as respostas


*/

/*
    -Notas:

Para compilar: iverilog -o Guia_0305.vvp Guia_0305.v
Para executar: vvp Guia_0305.vvp
*/

