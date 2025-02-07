/*
    -identificação: 

Guia_0104 - 02 / 08 / 2024

Nome: Davi Cândido de Almeida
Matricula: 857859
Código de Pessoa: 1527368

*/

/*

Foi necessario alterações para implemetar uma repetição pra a conversão de cada caracter da string, com 
2 programas um para lidar com hexadecimais e outro com octais

*/

module Guia_0105;
// define data
integer x = 0; // decimal
reg [8:0] b ; // binary
reg [0:4][7:0] s = "noite"; // char array[3] (3x8 bits - little Endian)
// actions
initial
begin : main
$display ( "Guia_0105 - Tests" );
$display ( "x = %d" , x );
$display ( "b = %9b", b );
$display ( "s = %s" , s );
while (x < 5) begin
    b = s[x];
    $display ( "b = [%3b] [%3b] [%3b] = %o %o %o" , b[8:6], b[5:3], b[2:0],   b[8:6], b[5:3], b[2:0] );
    x = x + 1;
end

end // main
endmodule // Guia_0105


/*

--------  1º Programa - hexadecimal :  --------

module Guia_0105;
// define data
integer x = 0; // decimal
reg [7:0] b ; // binary
reg [0:6][7:0] s = "2024-02"; // char array[3] (3x8 bits - little Endian)
// actions
initial
begin : main
$display ( "Guia_0105 - Tests" );
$display ( "x = %d" , x );
$display ( "b = %8b", b );
$display ( "s = %s" , s );
while (x < 7) begin
    b = s[x];
    $display ( "b = [%4b] [%4b] = %h %h", b[7:4], b[3:0], b[7:4], b[3:0] );
    x = x + 1;
end

end // main
endmodule // Guia_0105


    -Saídas de resultados:

Guia_0105 - Tests
x =           0
b = xxxxxxxx
s = PUC-M.G.
b = [0101] [0000] = 5 0
b = [0101] [0101] = 5 5
b = [0100] [0011] = 4 3
b = [0010] [1101] = 2 d
b = [0100] [1101] = 4 d
b = [0010] [1110] = 2 e
b = [0100] [0111] = 4 7
b = [0010] [1110] = 2 e

Guia_0105 - Tests
x =           0
b = xxxxxxxx
s = 2024-02
b = [0011] [0010] = 3 2
b = [0011] [0000] = 3 0
b = [0011] [0010] = 3 2
b = [0011] [0100] = 3 4
b = [0010] [1101] = 2 d
b = [0011] [0000] = 3 0
b = [0011] [0010] = 3 2

Guia_0105 - Tests
x =           0
b = xxxxxxxx
s = Belo Horizonte
b = [0100] [0010] = 4 2
b = [0110] [0101] = 6 5
b = [0110] [1100] = 6 c
b = [0110] [1111] = 6 f
b = [0010] [0000] = 2 0
b = [0100] [1000] = 4 8
b = [0110] [1111] = 6 f
b = [0111] [0010] = 7 2
b = [0110] [1001] = 6 9
b = [0111] [1010] = 7 a
b = [0110] [1111] = 6 f
b = [0110] [1110] = 6 e
b = [0111] [0100] = 7 4
b = [0110] [0101] = 6 5


Guia_0105 - Tests
x =           0
b = xxxxxxxx
s = Manha
b = [0100] [1101] = 4 d
b = [0110] [0001] = 6 1
b = [0110] [1110] = 6 e
b = [0110] [1000] = 6 8
b = [0110] [0001] = 6 1

--------  2º Programa - Octais :  --------

module Guia_0105;
// define data
integer x = 0; // decimal
reg [8:0] b ; // binary
reg [0:4][7:0] s = "noite"; // char array[3] (3x8 bits - little Endian)
// actions
initial
begin : main
$display ( "Guia_0105 - Tests" );
$display ( "x = %d" , x );
$display ( "b = %9b", b );
$display ( "s = %s" , s );
while (x < 5) begin
    b = s[x];
    $display ( "b = [%3b] [%3b] [%3b] = %o %o %o" , b[8:6], b[5:3], b[2:0],   b[8:6], b[5:3], b[2:0] );
    x = x + 1;
end

end // main
endmodule // Guia_0105


Guia_0105 - Tests
x =           0
b = xxxxxxxxx
s = noite
b = [001] [101] [110] = 1 5 6
b = [001] [101] [111] = 1 5 7
b = [001] [101] [001] = 1 5 1
b = [001] [110] [100] = 1 6 4
b = [001] [100] [101] = 1 4 5

*/

/*
    -Notas:

Para compilar: iverilog -o Guia_0105.vvp Guia_0105.v
Para executar: vvp Guia_0105.vvp
*/

