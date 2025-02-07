/*
    -identificação: 

Guia_1301 - 31 / 10 / 2024

Nome: Davi Cândido de Almeida
Matricula: 857859
Código de Pessoa: 1527368

*/

`include "ContadorAssincronoDecrescente.v"

module test_ContadorAssincronoDecrescente;

// Sinais de entrada e saída para o módulo
wire out_a, out_b, out_c, out_d, out_e; 
reg clk, clear, pulse, in1;


// Instancia o módulo
ContadorAssincronoDecrescente contador(out_a, out_b, out_c, out_d, out_e, pulse, in1, clear);

// Geração do clock
initial begin
    clk = 0;
    forever #5 clk = ~clk;
end

// Estímulos de teste
initial begin
    $monitor("Tempo=%0t | in1=%b | clear=%b | pulse = %b | out=%b%b%b%b%b",
             $time, in1, clear, pulse,out_a, out_b, out_c, out_d, out_e);

    // Inicialização
    in1 = 0;
    pulse = 0;
    clear = 1;

    #10 clear = 0; // Desativa o clear após a limpeza

    // Teste de contador

    #10 in1 = 1;
    #10 pulse = 1;
    #10 pulse = 0;
    #10 pulse = 1;
    #10 pulse = 0;

    #10 pulse = 1;
    #10 pulse = 0;

    #10 in1 = 0;

    #10 pulse = 1;
    #10 pulse = 0;

    #10 in1 = 0; //Teste de parada de flip-flops

    #10 pulse = 1;
    #10 pulse = 0;

    #10 pulse = 1;
    #10 pulse = 0;

    #10 in1 = 1; //Teste de retomada de flip-flops

    #10 pulse = 1;
    #10 pulse = 0;

    #10 pulse = 1;
    #10 pulse = 0;

    #10 pulse = 1;
    #10 pulse = 0;

    #10 pulse = 1;
    #10 pulse = 0;

        #10 pulse = 1;
    #10 pulse = 0;

    #10 pulse = 1;
    #10 pulse = 0;

    #10 pulse = 1;
    #10 pulse = 0;

    #10 pulse = 1;
    #10 pulse = 0;




    $finish;
end

endmodule

/*
    -Saídas de resultados:

Tempo=0 | in1=0 | clear=1 | pulse = 0 | out=11111
Tempo=10 | in1=0 | clear=0 | pulse = 0 | out=11111
Tempo=20 | in1=1 | clear=0 | pulse = 0 | out=11111
Tempo=30 | in1=1 | clear=0 | pulse = 1 | out=11110
Tempo=40 | in1=1 | clear=0 | pulse = 0 | out=11110
Tempo=50 | in1=1 | clear=0 | pulse = 1 | out=11101
Tempo=60 | in1=1 | clear=0 | pulse = 0 | out=11101
Tempo=70 | in1=1 | clear=0 | pulse = 1 | out=11100
Tempo=80 | in1=1 | clear=0 | pulse = 0 | out=11100
Tempo=90 | in1=0 | clear=0 | pulse = 0 | out=11100
Tempo=100 | in1=0 | clear=0 | pulse = 1 | out=11100
Tempo=110 | in1=0 | clear=0 | pulse = 0 | out=11100
Tempo=130 | in1=0 | clear=0 | pulse = 1 | out=11100
Tempo=140 | in1=0 | clear=0 | pulse = 0 | out=11100
Tempo=150 | in1=0 | clear=0 | pulse = 1 | out=11100
Tempo=160 | in1=0 | clear=0 | pulse = 0 | out=11100
Tempo=170 | in1=1 | clear=0 | pulse = 0 | out=11100
Tempo=180 | in1=1 | clear=0 | pulse = 1 | out=11011
Tempo=190 | in1=1 | clear=0 | pulse = 0 | out=11011
Tempo=200 | in1=1 | clear=0 | pulse = 1 | out=11010
Tempo=210 | in1=1 | clear=0 | pulse = 0 | out=11010
Tempo=220 | in1=1 | clear=0 | pulse = 1 | out=11001
Tempo=230 | in1=1 | clear=0 | pulse = 0 | out=11001
Tempo=240 | in1=1 | clear=0 | pulse = 1 | out=11000
Tempo=250 | in1=1 | clear=0 | pulse = 0 | out=11000
Tempo=260 | in1=1 | clear=0 | pulse = 1 | out=10111
Tempo=270 | in1=1 | clear=0 | pulse = 0 | out=10111
Tempo=280 | in1=1 | clear=0 | pulse = 1 | out=10110
Tempo=290 | in1=1 | clear=0 | pulse = 0 | out=10110
Tempo=300 | in1=1 | clear=0 | pulse = 1 | out=10101
Tempo=310 | in1=1 | clear=0 | pulse = 0 | out=10101
Tempo=320 | in1=1 | clear=0 | pulse = 1 | out=10100
Tempo=330 | in1=1 | clear=0 | pulse = 0 | out=10100

*/

/*
    -Notas:

Para compilar: iverilog -o Guia_1301.vvp Guia_1301.v
Para executar: vvp Guia_1301.vvp
*/

