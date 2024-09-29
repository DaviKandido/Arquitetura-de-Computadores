/*
    -identificação: 

Guia_0902 - 27 / 09 / 2024

Nome: Davi Cândido de Almeida
Matricula: 857859
Código de Pessoa: 1527368

*/


/*

02.) Projetar e descrever em Verilog módulos
geradores de pulso (pulse) com períodos diferentes.
O nome do arquivo deverá ser Guia_0902.v,
e poderá seguir o modelo descrito a seguir.
O gerador de clock do Guia_0900.v deverá
ser previamente isolado em um arquivo único
cujo nome deverá ser clock.v, para uso posterior.
Incluir previsão de testes e verificação da
carta de tempo usando GTKWave.

*/

// ---------------------------
// -- test clock generator (3)
// ---------------------------
`include "clock.v"

module pulse1 ( signal, clock );
        input clock;
        output signal;
        reg signal;
    always @ ( posedge clock )
    begin
        signal = 1'b1;
        #4 signal = 1'b0;
        #4 signal = 1'b1;
        #4 signal = 1'b0;
        #4 signal = 1'b1;
        #4 signal = 1'b0;
    end
endmodule // pulse
module pulse2 ( signal, clock );
        input clock;
        output signal;
        reg signal;
    always @ ( posedge clock )
    begin
        signal = 1'b1;
        #5 signal = 1'b0;
    end
    endmodule // pulse

module pulse3 ( signal, clock );
        input clock;
        output signal;
        reg signal;
    always @ ( negedge clock )
    begin
        signal = 1'b1;
        #15 signal = 1'b0;
        #15 signal = 1'b1;
    end
endmodule // pulse

module pulse4 ( signal, clock );
        input clock;
        output signal;
        reg signal;
    always @ ( negedge clock )
    begin
        signal = 1'b1;
        #20 signal = 1'b0;
        #20 signal = 1'b1;
        #20 signal = 1'b0;
    end
endmodule // pulse

module Guia_0902;
        wire clock;
        clock clk ( clock );
        wire p1,p2,p3,p4;
        pulse1 pls1 ( p1, clock );
        pulse2 pls2 ( p2, clock );
        pulse3 pls3 ( p3, clock );
        pulse4 pls4 ( p4, clock );
    initial begin
        $dumpfile ( " Guia_0902.vcd" );
        $dumpvars ( 1, clock, p1, p2, p3, p4 );
         #480 $finish;
end
endmodule // Guia_0902

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

Para compilar: iverilog -o Guia_0902.vvp Guia_0902.v
Para executar: vvp Guia_0902.vvp
*/

