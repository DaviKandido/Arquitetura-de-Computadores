/*
    -identificação: 

Guia_0907 - 28 / 09 / 2024

Nome: Davi Cândido de Almeida
Matricula: 857859
Código de Pessoa: 1527368

*/


/*

07.) Projetar e descrever em Verilog um módulo
gerador de pulso (pulse) com marcação igual
a 8 unidades de tempo, sincronizado com
o nível alto e estável do gerador do Guia_0900.v.
O nome do arquivo deverá ser Guia_0907.v.
Incluir previsão de testes e verificação da
carta de tempo usando GTKWave.
DICA: Usar always @(clk)

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

module pulse0907 ( signal, clock );
    input clock;
    output signal;
    reg signal;

    always @ ( posedge clock ) //(posedge) Garante uma sincronização apenas com nivel algo - Erro na dica?
    begin
    signal = 1'b1;
    #8 signal = 1'b0;

    end
endmodule // pulse



module Guia_0907;
        wire clock_0900;
        clock_0900 clk ( clock_0900 );

        wire p1_0907;
        pulse0907 pls1 ( p1_0907, clock_0900 );



    initial begin
        $dumpfile ( " Guia_0907.vcd" );
        $dumpvars ( 1, clock_0900, p1_0907 );
         #480 $finish;
end
endmodule // Guia_0907

/*
    -Saídas de resultados:
    

..etc

*/

/*
    -Notas:

Para compilar: iverilog -o Guia_0907.vvp Guia_0907.v
Para executar: vvp Guia_0907.vvp
*/

