/*
    -identificação: 

Guia_0304 - 15 / 08 / 2024

Nome: Davi Cândido de Almeida
Matricula: 857859
Código de Pessoa: 1527368

*/
module Guia_0304;
// define data
 reg signed [7:0] a1 = 8'b00011001; // binary
 reg signed [7:0] a2 = 8'b00001101; // binary

  reg signed [7:0] b1 = 8'b101_1101; // 101.1101(2) -> 5.8125 em decimal
  reg signed [7:0] b2 = 8'b010_0100; // 10.01(2) -> 2.25 em decimal

 reg signed [5:0] c1 = 6'b110110; // binary
 reg signed [5:0] c2 = 6'b101101; // binary

 reg signed [9:0] d1 = 10'o376; // Octal (10 bits)
 reg signed [9:0] d2 = 10'o267; // Octal (10 bits)

 reg signed [12:0] e1 = 13'h7d2; // Hexadecimal
 reg signed [12:0] e2 = 13'ha51; // Hexadecimal

 reg signed [8:0] R = 0; // binary
 reg signed [12:0] R2 = 0; // binary

// actions
 initial
 begin : main
 $display ( "Guia_0304 - Tests" );

 $display ( "a1 = %8b = %d", a1, a1 );
 $display ( "a2 = %8b = %d", a2, a2 );
 R = a1 - a2;
 $display ( "R = a1-a2 = %8b-%8b = %8b = %d\n", a1, a2, R, R );

 // Para b1 e b2, os últimos 4 bits são parte fracionária
 $display("b1 = %b (Parte inteira: %d, Parte fracionária: %0.4f)", b1, b1[7:4], b1[3:0] * 1.0 / 16);
 $display("b2 = %b (Parte inteira: %d, Parte fracionária: %0.4f)", b2, b2[7:4], b2[3:0] * 1.0 / 16);
    
    R = b1 - b2;
    $display("R = b1 - b2 = %b - %b = %b.%b => (Inteiro)%d (Fracionario) %0.4f = %f(10)\n", b1, b2, R[7:4], R[3:0], R[7:4], R[3:0] * 1.0 / 16, (R[6:4] + R[3:0] * 1.0 / 16));
    
 $display ( "c1 = %6b = %d", c1, c1 );
 $display ( "c2 = %6b = %d", c2, c2 );
 R = c1 - c2;
 $display ( "R = c1-c2 = %6b-%6b = %6b = %d(10) = %1d%1d(4)\n", c1, c2, R, R, R[3:2], R[1:0] );

 $display ( "d1 = %10b = %d", d1, d1 );
 $display ( "d2 = %10b = %d", d2, d2 );
 R = d1 - d2;
 $display ( "R = d1-d2 = %10b-%10b = %10b = %d(10) = %o(8) \n", d1, d2, R, R, R );

 $display ( "e1 = %13b = %d", e1, e1 );
 $display ( "e2 = %13b = %d", e2, e2 );
 R2 = e1 - e2;
 $display ( "R = e1-e2 = %b-%b = %b = %d(10) = %h(16)\n", e1, e2, R2, R2, R2 );

 end // main
endmodule // Guia_0304


/*
    -Saídas de resultados:

Guia_0304 - Tests
a1 = 00011001 =   25
a2 = 00001101 =   13
R = a1-a2 = 00011001-00001101 = 000001100 =   12

b1 = 01011101 (Parte inteira:  5, Parte fracionária: 0.8125)
b2 = 00100100 (Parte inteira:  2, Parte fracionária: 0.2500)
R = b1 - b2 = 01011101 - 00100100 = 0011.1001 => (Inteiro) 3 (Fracionario) 0.5625 = 3.562500(10)

c1 = 110110 = -10
c2 = 101101 = -19
R = c1-c2 = 110110-101101 = 000001001 =    9(10) = 21(4)

d1 = 0011111110 =  254
d2 = 0010110111 =  183
R = d1-d2 = 0011111110-0010110111 =  001000111 =   71(10) = 107(8) 

e1 = 0011111010010 =  2002
e2 = 0101001010001 =  2641
R = e1-e2 = 0011111010010-0101001010001 = 1110110000001 =  -639(10) = 1d81(16) //Representação de um hexadecimal negativo
                                                                               -27F //Representativo

//Saida com todas as respostas


*/

/*
    -Notas:

Para compilar: iverilog -o Guia_0304.vvp Guia_0304.v
Para executar: vvp Guia_0304.vvp
*/

