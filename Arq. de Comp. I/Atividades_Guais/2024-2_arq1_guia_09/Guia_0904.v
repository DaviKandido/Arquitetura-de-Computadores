/*
    -identificação: 

Guia_0904 - 28 / 09 / 2024

Nome: Davi Cândido de Almeida
Matricula: 857859
Código de Pessoa: 1527368

*/


/*

04.) Projetar e descrever em Verilog um módulo
gerador de pulso (pulse) com frequência igual
a quatro vezes a frequência (um quarto do período)
do gerador do Guia_0900.v.
O nome do arquivo deverá ser Guia_0904.v.
Incluir previsão de testes e verificação da
carta de tempo usando GTKWave.

*/


//`include "clock.v" //Colocado manualmente para facilitar visualização

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


module pulse1 ( signal, clock );
        input clock;
        output signal;
        reg signal;
        
    initial
        begin
         signal = 1'b0;
        end

    always 
    begin
        #3 signal = 1'b1; // 4x frequência e 1/4 o periodo
        #3 signal = 1'b0; // 4x frequência e 1/4 o periodo
        #3 signal = 1'b1; // 4x frequência e 1/4 o periodo
        #3 signal = 1'b0; // 4x frequência e 1/4 o periodo
        #3 signal = 1'b1; // 4x frequência e 1/4 o periodo
        #3 signal = 1'b0; // 4x frequência e 1/4 o periodo
        #3 signal = 1'b1; // 4x frequência e 1/4 o periodo
        #3 signal = 1'b0; // 4x frequência e 1/4 o periodo
    end
endmodule // pulse



module Guia_0904;
        wire clock;
        clock clk ( clock );

        wire p1;
        pulse1 pls1 ( p1, clock );
    initial begin
        $dumpfile ( " Guia_0904.vcd" );
        $dumpvars ( 1, clock, p1);
         #480 $finish;
end
endmodule // Guia_0904

/*
    -Saídas de resultados:

$dumpvars
x$
0#
1"
0!
$end
#3
0"
#6
1"
#9
0"
#12
1"
1!
#15
0"
#18
1"
#21
0"
#24
1"
0!
#27
0"
#30
1"
#33
0"
#36
1"
1!
#39
0"
#42
1"
#45
0"
#48
1"
0!
#51
0"
#54
1"
#57
0"
#60
1"
1!
1#
#63
0"
#66
1"
#69
0"
#72
1"
0!
#75
0"
#78
1"
#81
0"
#84
1"
1!
#87
0"
#90
1"
#93
0"
#96
1"
0!
#99
0"
#102
1"
#105
0"
#108
1"
1!
#111
0"
#114
1"
#117
0"
#120
1"
0!
1$

..etc

*/

/*
    -Notas:

Para compilar: iverilog -o Guia_0904.vvp Guia_0904.v
Para executar: vvp Guia_0904.vvp
*/

