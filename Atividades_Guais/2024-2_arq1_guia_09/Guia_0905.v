/*
    -identificação: 

Guia_0905 - 28 / 09 / 2024

Nome: Davi Cândido de Almeida
Matricula: 857859
Código de Pessoa: 1527368

*/


/*

05.) Projetar e descrever em Verilog um módulo
gerador de pulso (pulse) com marcação igual
a 4 unidades de tempo, sincronizado com a
borda de subida do gerador do Guia_0901.v.
O nome do arquivo deverá ser Guia_0905.v.
Incluir previsão de testes e verificação da
carta de tempo usando GTKWave.
DICA: Usar always @(posedge clk).

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
endmodule

module pulse0901 ( signal, clock );
    input clock;
    output signal;
    reg signal;

    always @ ( clock )
    begin
    signal = 1'b1;
    #3 signal = 1'b0;
    #3 signal = 1'b1;
    #3 signal = 1'b0;
    end
endmodule // pulse

module pulse0905 ( signal, signal0901 );
    input signal0901;
    output signal;
    reg signal;

    always @ ( posedge signal0901 )
    begin
    signal = 1'b1;
    #4 signal = 1'b0;

    end
endmodule // pulse





module Guia_0905;
        wire clock;
        clock clk ( clock );

        wire p1_0901;
        pulse0901 pls1 ( p1_0901, clock );

        wire p2_0905;
        pulse0905 pls5 ( p2_0905, p1_0901 );


    initial begin
        $dumpfile ( " Guia_0905.vcd" );
        $dumpvars ( 1, clock, p1_0901, p2_0905);
         #480 $finish;
end
endmodule // Guia_0905

/*
    -Saídas de resultados:


$dumpvars
1#
1"
0!
$end
#3
0"
#4
0#
#6
1#
1"
#9
0"
#10
0#
#12
1#
1"
1!
#15
0"
#16
0#
#18
1#
1"
#21
0"
#22
0#
#24
1#
1"
0!
#27
0"
#28
0#
#30
1#
1"
#33
0"
#34
0#
#36
1#
1"
1!
#39
0"
#40
0#
#42
1#
1"
#45
0"
#46
0#
#48
1#
1"
0!
#51
0"
#52
0#
#54
1#
1"
#57
0"
#58
0#
#60
1#
1"
1!
#63
0"
#64
0#
#66
1#
1"
#69
0"
#70
0#
#72
1#
1"
0!
#75
0"
#76
0#
#78
1#
1"
#81
0"
#82
0#
#84
1#
1"
1!
#87
0"
#88
0#
#90
1#
1"
#93
0"
#94
0#
#96
1#
1"
0!
#99
0"
#100
0#
#102
1#
1"
#105
0"
#106
0#
#108
1#
1"
1!
#111
0"
#112
0#
#114
1#
1"
#117
0"
#118
0#
#120
1#
1"
0!
#123
0"
#124
0#
#126
1#
1"
#129
0"
#130
0#
#132

..etc

*/

/*
    -Notas:

Para compilar: iverilog -o Guia_0905.vvp Guia_0905.v
Para executar: vvp Guia_0905.vvp
*/

