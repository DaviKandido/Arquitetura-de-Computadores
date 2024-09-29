/*
    -identificação: 

Guia_0900 - 27 / 09 / 2024

Nome: Davi Cândido de Almeida
Matricula: 857859
Código de Pessoa: 1527368

*/

/*

Projetar e descrever em Verilog um módulo
gerador de clock.
O nome do arquivo deverá ser Guia_0900.v,
e poderá seguir o modelo descrito abaixo.
Incluir previsão de testes e verificação da
carta de tempo usando GTKWave.

*/

/// ---------------------------
// -- test clock generator (1)
// ---------------------------
module clock ( output clk );

    reg clk;

    initial
        begin
         clk = 1'b0;
        end

    always
        begin
         #12 clk = ~clk;
        end
    endmodule // clock ( )

    module Guia_0900;

    wire clk;
    clock CLK1 ( clk );
    initial 
        begin
            $dumpfile ( "Guia_0900.vcd" );
            $dumpvars;
            #120 $finish;
        end
endmodule // Guia_0901 ( )

/*
    -Saídas de resultados:

    $scope module Guia_0900 $end
    $var wire 1 ! clk $end
    $scope module CLK1 $end
    $var reg 1 ! clk $end
    $upscope $end
    $upscope $end
    $enddefinitions $end
    #0
    $dumpvars
    0!
    $end
    #12
    1!
    #24
    0!
    #36
    1!
    #48
    0!
    #60
    1!
    #72
    0!
    #84
    1!
    #96
    0!
    #108
    1!
    #120
    0!

*/

/*
    -Notas:

Para compilar: iverilog -o Guia_0900.vvp Guia_0900.v
Para executar: vvp Guia_0900.vvp
*/

