/*
    -identificação: 

Guia_0906 - 28 / 09 / 2024

Nome: Davi Cândido de Almeida
Matricula: 857859
Código de Pessoa: 1527368

*/


/*

06.) Projetar e descrever em Verilog um módulo
gerador de pulso (pulse) com marcação igual
a 5 unidades de tempo, sincronizado com a
borda de descida do gerador do Guia_0900.v.
O nome do arquivo deverá ser Guia_0906.v.
Incluir previsão de testes e verificação da
carta de tempo usando GTKWave.
DICA: Usar always @(negedge clk).

*/


//`include "clock.v" //Colocado manualmente para facilitar visualização

module clock_0900 ( output clk );
    reg clk;
    initial
    begin
        clk = 1'b0;
    end
    always
    begin
    #12 clk = ~clk;
    end
endmodule

module pulse0906 ( signal, clock );
    input clock;
    output signal;
    reg signal;

    always @ ( negedge clock )
    begin
    signal = 1'b1;
    #5 signal = 1'b0;

    end
endmodule // pulse



module Guia_0906;
        wire clock_0900;
        clock_0900 clk ( clock_0900 );

        wire p1_0906;
        pulse0906 pls1 ( p1_0906, clock_0900 );



    initial begin
        $dumpfile ( " Guia_0906.vcd" );
        $dumpvars ( 1, clock_0900, p1_0906 );
         #480 $finish;
end
endmodule // Guia_0906

/*
    -Saídas de resultados:
    
$dumpvars
x"
0!
$end
#12
1!
#24
1"
0!
#29
0"
#36
1!
#48
1"
0!
#53
0"
#60
1!
#72
1"
0!
#77
0"
#84
1!
#96
1"
0!
#101
0"
#108
1!
#120
1"
0!
#125
0"
#132
1!
#144
1"
0!
#149
0"
#156
1!
#168
1"
0!
#173
0"
#180
1!
#192
1"
0!
#197
0"
#204
1!
#216
1"
0!
#221
0"
#228
1!
#240
1"
0!
#245
0"
#252
1!
#264
1"
0!
#269
0"
#276
1!
#288
1"
0!
#293
0"
..etc

*/

/*
    -Notas:

Para compilar: iverilog -o Guia_0906.vvp Guia_0906.v
Para executar: vvp Guia_0906.vvp
*/

