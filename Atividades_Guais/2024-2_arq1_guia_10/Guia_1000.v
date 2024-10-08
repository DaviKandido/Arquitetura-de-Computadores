/*
    -identificação: 

Guia_10 - 02 / 08 / 2024

Nome: Davi Cândido de Almeida
Matricula: 857859
Código de Pessoa: 1527368

*/

/*
    -Cabeçalho:
    
Guia_0101.v
857859 - Davi Cândido de Almeida
*/

module Guia_0101;
    // define data
    integer x = 13; // decimal
    reg [7:0] b = 0; // binary (bits - little endian)
    // actions
    initial
        begin : main
            $display ( "Guia_0101 - Tests" );
            $display ( "x = %d" , x );
            $display ( "b = %8b", b );
            b = x;
            $display ( "b = %8b", b );
        end // main
endmodule // Guia_0101

/*
    -Saídas de resultados:


*/

/*
    -Notas:

Para compilar: iverilog -o Guia_0101.vvp Guia_0101.v
Para executar: vvp Guia_0101.vvp
*/

