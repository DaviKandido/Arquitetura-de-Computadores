/*
    -identificação: 

Guia_1305 - 31 / 10 / 2024

Nome: Davi Cândido de Almeida
Matricula: 857859
Código de Pessoa: 1527368

*/

`include "ContadorSincronoCrescente.v"

module test_ContadorSincronoCrescente;

// Sinais de entrada e saída para o módulo
wire out_a, out_b, out_c; 
reg clk, clear, pulse, in1;


// Instancia o módulo
ContadorSincronoCrescente contador(out_a, out_b, out_c, pulse, clk, clear);

// Geração do clock
initial begin
    clk = 0;
    forever #5 clk = ~clk;
end

// Estímulos de teste
initial begin
    $monitor("Tempo=%0t | clock=%b | clear=%b | pulse = %b | out=%b%b%b",
             $time, clk, clear, pulse, out_a, out_b, out_c);

    // Inicialização
    in1 = 0;
    pulse = 0;
    clear = 1;

    #10 clear = 1; // Desativa o clear após a limpeza

    // Teste de contador


    #10 clear = 0; // ativa o clear após a limpeza

       in1 = 1;
    #5 pulse = 1;
    #5 pulse = 0;
    #5 pulse = 1;
    #5 pulse = 0;

    #5 pulse = 1;
    #5 pulse = 0;

    #5 in1 = 0;

    #5 pulse = 1;
    #5 pulse = 0;

    #5 in1 = 0; //Teste de parada de flip-flops

    #5 pulse = 1;
    #5 pulse = 0;

    #5 in1 = 1; //Teste de retomada de flip-flops

    #5 pulse = 1;
    #5 pulse = 0;

    #5 pulse = 1;
    #5 pulse = 0;

    #5 pulse = 1;
    #5 pulse = 0;

    #5 pulse = 1;
    #5 pulse = 0;

    #5 pulse = 1;
    #5 pulse = 0;

    #5 pulse = 1;
    #5 pulse = 0;

    #5 pulse = 1;
    #5 pulse = 0;

    #5 pulse = 1;
    #5 pulse = 0;

    #5 pulse = 1;
    #5 pulse = 0;

    #5 clear = 0; //Teste de limpeza



    $finish;
end

endmodule

/*

    OBS: tive algum erro que manteve a siada fixa em 1, no entanto
    não consegui descobrir a causação do problema.

    -Saídas de resultados:
Tempo=0 | clock=0 | clear=1 | pulse = 0 | out=111
Tempo=5 | clock=1 | clear=1 | pulse = 0 | out=111
Tempo=10 | clock=0 | clear=1 | pulse = 0 | out=111
Tempo=15 | clock=1 | clear=1 | pulse = 0 | out=111
Tempo=20 | clock=0 | clear=0 | pulse = 0 | out=111
Tempo=25 | clock=1 | clear=0 | pulse = 1 | out=111
Tempo=30 | clock=0 | clear=0 | pulse = 0 | out=111
Tempo=35 | clock=1 | clear=0 | pulse = 1 | out=111
Tempo=40 | clock=0 | clear=0 | pulse = 0 | out=111
Tempo=45 | clock=1 | clear=0 | pulse = 1 | out=111
Tempo=50 | clock=0 | clear=0 | pulse = 0 | out=111
Tempo=55 | clock=1 | clear=0 | pulse = 0 | out=111
Tempo=60 | clock=0 | clear=0 | pulse = 1 | out=111
Tempo=65 | clock=1 | clear=0 | pulse = 0 | out=111
Tempo=70 | clock=0 | clear=0 | pulse = 0 | out=111
Tempo=75 | clock=1 | clear=0 | pulse = 1 | out=111
Tempo=80 | clock=0 | clear=0 | pulse = 0 | out=111
Tempo=85 | clock=1 | clear=0 | pulse = 0 | out=111
Tempo=90 | clock=0 | clear=0 | pulse = 1 | out=111
Tempo=95 | clock=1 | clear=0 | pulse = 0 | out=111
Tempo=100 | clock=0 | clear=0 | pulse = 1 | out=111
Tempo=105 | clock=1 | clear=0 | pulse = 0 | out=111
Tempo=110 | clock=0 | clear=0 | pulse = 1 | out=111
Tempo=115 | clock=1 | clear=0 | pulse = 0 | out=111
Tempo=120 | clock=0 | clear=0 | pulse = 1 | out=111
Tempo=125 | clock=1 | clear=0 | pulse = 0 | out=111
Tempo=130 | clock=0 | clear=0 | pulse = 1 | out=111
Tempo=135 | clock=1 | clear=0 | pulse = 0 | out=111
Tempo=140 | clock=0 | clear=0 | pulse = 1 | out=111
Tempo=145 | clock=1 | clear=0 | pulse = 0 | out=111
Tempo=150 | clock=0 | clear=0 | pulse = 1 | out=111
Tempo=155 | clock=1 | clear=0 | pulse = 0 | out=111
Tempo=160 | clock=0 | clear=0 | pulse = 1 | out=111
Tempo=165 | clock=1 | clear=0 | pulse = 0 | out=111
Tempo=170 | clock=0 | clear=0 | pulse = 1 | out=111
Tempo=175 | clock=1 | clear=0 | pulse = 0 | out=111
Tempo=180 | clock=0 | clear=0 | pulse = 0 | out=111

*/

/*
    -Notas:

Para compilar: iverilog -o Guia_1301.vvp Guia_1301.v
Para executar: vvp Guia_1301.vvp
*/

