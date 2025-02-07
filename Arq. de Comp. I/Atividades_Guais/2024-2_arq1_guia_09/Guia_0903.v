/*
    -identificação: 

Guia_0903 - 27 / 09 / 2024

Nome: Davi Cândido de Almeida
Matricula: 857859
Código de Pessoa: 1527368

*/


/*

03.) Projetar e descrever em Verilog um módulo
gerador de pulso (pulse) com frequência igual
a um terço da frequência (três vezes o período)
do gerador do Guia_0900.v.
O nome do arquivo deverá ser Guia_0903.v.
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
        #36 signal = ~signal; // 1/3 frequência e 3x o periodo
    end
endmodule // pulse



module Guia_0903;
        wire clock;
        clock clk ( clock );
        pulse1 pls1 ( p1, clock );

        wire p1;
    initial begin
        $dumpfile ( " Guia_0903.vcd" );
        $dumpvars ( 1, clock, p1);
         #480 $finish;
end
endmodule // Guia_0903

/*
    -Saídas de resultados:

x$dumpvars
0"
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
1"
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
#132
0"
1!
#144
0!
#156
1!
#168
0!
#180
1!
#192
0!
#204
1"
1!
#216
0!
#228
1!
#240
0!
#252
1!
#264
0!
#276
0"
1!
#288
0!
#300
1!
#312
0!
#324
1!
#336
0!
#348
1"
1!
#360
0!
#372
1!
#384
0!
#396
1!
#408
0!
#420
0"
1!
#432
0!
#444
1!
#456
0!
#468
1!
#480
0!

..etc

*/

/*
    -Notas:

Para compilar: iverilog -o Guia_0903.vvp Guia_0903.v
Para executar: vvp Guia_0903.vvp
*/

