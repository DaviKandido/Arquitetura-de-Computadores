/*
    -identificação: 

Guia_0104 - 02 / 08 / 2024

Nome: Davi Cândido de Almeida
Matricula: 857859
Código de Pessoa: 1527368

*/

/*
    -Cabeçalho:
    
Guia_0104.v
857859 - Davi Cândido de Almeida
*/

module Guia_0104;
    // define data
    integer x = 8'b00100111; // binário
    reg [7:0] b = 0; // binary

    // actions
    initial
    begin : main
        $display("Guia_0104 - Tests");
        $display("x = %b", x);
        b = x; 
        $display("b = %8b", b);
        $display ( "b = [%4b] [%4b] = %x %x", b[7:4], b[3:0], b[7:4], b[3:0] );
    end // main
endmodule // Guia_0104


/*
    -Saídas de resultados:

//Foi necessario esta modificação: // $display("b = [%2b] [%2b] [%2b] = %x %x %x", b[5:4], b[3:2], b[1:0], b[5:4], b[3:2], b[1:0]);
Guia_0104 - Tests
x = 00000000000000000000000000010100
b = 00010100
b = [01] [01] [00] = 1 1 0

//Foi necessario esta modificação: // $display("b = [%3b] [%3b] = %x %x", b[5:3], b[2:0],   b[5:3], b[2:0] );

Guia_0104 - Tests
x = 00000000000000000000000000011010
b = 00011010
b = [011] [010] = 3 2



//Foi necessario esta modificação: // $display ( "b = [%4b] [%4b] = %x %x", b[7:4], b[3:0], b[7:4], b[3:0] );
Guia_0104 - Tests
x = 00000000000000000000000000100111
b = 00100111
b = [0010] [0111] = 2 7


//Foi necessario esta modificação: //  $display("b = [%3b] [%3b] = %x %x", b[5:3], b[2:0],   b[5:3], b[2:0] );
Guia_0104 - Tests
x = 00000000000000000000000000100101
b = 00100101
b = [100] [101] = 4 5

//Foi necessario esta modificação: // $display("b = [%2b] [%2b] [%2b] = %x %x %x", b[5:4], b[3:2], b[1:0], b[5:4], b[3:2], b[1:0]);
Guia_0104 - Tests
x = 00000000000000000000000000101101
b = 00101101
b = [10] [11] [01] = 2 3 1

*/

/*
    -Notas:

Para compilar: iverilog -o Guia_0104.vvp Guia_0104.v
Para executar: vvp Guia_0104.vvp
*/

