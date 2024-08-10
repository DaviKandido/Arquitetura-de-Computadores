/*
    -identificação: 

Guia_0202 - 08 / 08 / 2024

Nome: Davi Cândido de Almeida
Matricula: 857859
Código de Pessoa: 1527368

*/

module Guia_0202;
    // define data
    real x = 0.75; // decimal
    integer y = 7 ; // counter
    reg [7:0] b = 0 ; // binary
    // actions
    initial
    begin : main
    $display ( "Guia_0202 - Tests" );
    $display ( "x = %f" , x );
    $display ( "b = 0.%8b", b );
    while ( x > 0 && y >= 0 )
    begin
    if ( x*2 >= 1 )
        begin
            b[y] = 1;
            x = x*2.0 - 1.0;
        end
        else
        begin
            b[y] = 0;
            x = x*2.0;
        end // end if
            $display ( "b = 0.%8b", b );
            y=y-1;
        end // end while
    end // main
endmodule // Guia_0202


/*
    -Saídas de resultados:

Guia_0202 - Tests
x = 0.375000
b = 0.00000000
b = 0.00000000
b = 0.01000000
b = 0.01100000

Guia_0202 - Tests
x = 0.125000
b = 0.00000000
b = 0.00000000
b = 0.00000000
b = 0.00100000

Guia_0202 - Tests
x = 0.625000
b = 0.00000000
b = 0.10000000
b = 0.10000000
b = 0.10100000

Guia_0202 - Tests
x = 0.031250
b = 0.00000000
b = 0.00000000
b = 0.00000000
b = 0.00000000
b = 0.00000000
b = 0.00001000

Guia_0202 - Tests
x = 0.750000
b = 0.00000000
b = 0.10000000
b = 0.11000000
*/
/*
    -Notas:

Para compilar: iverilog -o Guia_0202.vvp Guia_0202.v
Para executar: vvp Guia_0202.vvp
*/

