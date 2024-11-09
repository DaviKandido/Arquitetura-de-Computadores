/*
    -identificação: 

Guia_1403 - 08 / 11 / 2024

Nome: Davi Cândido de Almeida
Matricula: 857859
Código de Pessoa: 1527368

*/

`include "DeslocadorAnelDireita1Bit.v"

module Guia_1403;

// Sinais de entrada e saída para o módulo
wire out_0, out_1, out_2, out_3, out_4, out_5; 
reg clock, clear, input0;


// Instancia o módulo
DeslocadorAnelDireita1Bit deslocador(out_0, out_1, out_2, out_3, out_4, out_5, input0, clock, clear);

// Geração do clock
initial begin
    clock = 0;
    forever #5 clock = ~clock;
end

// Estímulos de teste
initial begin
    $monitor("Tempo=%0t | clear=%b | input0 = %b | out=%b%b%b%b%b%b",
             $time, clear, input0, out_0, out_1, out_2, out_3, out_4, out_5);

    // Inicialização
    input0 = 0;
    clear = 1;

    #10 clear = 0; // Desativa o clear após a limpeza

    // Teste de contador


    #5 input0 = 1;
    #5 input0 = 0;
    #10 

    #10 
    #10 
    #10
    #10
    #5
    #5 input0 = 1;
    #5 input0 = 0;
    #10
    #10

    #10 clear = 1;
    #10
    #10


    $finish;
end

endmodule

/*
    -Saídas de resultados:
[Running] Guia_1403.v
Tempo=0 | clear=1 | input0 = 0 | out=xxxxxx
Tempo=5 | clear=1 | input0 = 0 | out=000000
Tempo=10 | clear=0 | input0 = 0 | out=000000
Tempo=15 | clear=0 | input0 = 1 | out=100000
Tempo=20 | clear=0 | input0 = 0 | out=100000
Tempo=25 | clear=0 | input0 = 0 | out=010000
Tempo=35 | clear=0 | input0 = 0 | out=001000
Tempo=45 | clear=0 | input0 = 0 | out=000100
Tempo=55 | clear=0 | input0 = 0 | out=000010
Tempo=65 | clear=0 | input0 = 0 | out=000001
Tempo=75 | clear=0 | input0 = 0 | out=100000
Tempo=80 | clear=0 | input0 = 1 | out=100000
Tempo=85 | clear=0 | input0 = 0 | out=010000
Tempo=95 | clear=0 | input0 = 0 | out=001000
Tempo=105 | clear=0 | input0 = 0 | out=000100
Tempo=115 | clear=1 | input0 = 0 | out=000000
[Done] exit with code=0 in 0.127 seconds

*/

/*
    -Notas:

Para compilar: iverilog -o Guia_1403.vvp Guia_1403.v
Para executar: vvp Guia_1403.vvp
*/

