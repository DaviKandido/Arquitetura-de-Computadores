/*
    -identificação: 

Guia_1403 - 08 / 11 / 2024

Nome: Davi Cândido de Almeida
Matricula: 857859
Código de Pessoa: 1527368

*/

`include "DeslocadorAnelTorcidoEsquerda1Bit.v"

module Guia_1403;

// Sinais de entrada e saída para o módulo
wire out_0, out_1, out_2, out_3, out_4, out_5; 
reg clock, clear, input0;


// Instancia o módulo
DeslocadorAnelTorcidoEsquerda1Bit deslocador(out_0, out_1, out_2, out_3, out_4, out_5, input0, clock, clear);

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
    #10
    #10
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
[Running] Guia_1404.v
Tempo=0 | clear=1 | input0 = 0 | out=xxxxxx
Tempo=5 | clear=1 | input0 = 0 | out=000000
Tempo=10 | clear=0 | input0 = 0 | out=000000
Tempo=15 | clear=0 | input0 = 1 | out=000001
Tempo=20 | clear=0 | input0 = 0 | out=000001
Tempo=25 | clear=0 | input0 = 0 | out=000011
Tempo=35 | clear=0 | input0 = 0 | out=000111
Tempo=45 | clear=0 | input0 = 0 | out=001111
Tempo=55 | clear=0 | input0 = 0 | out=011111
Tempo=65 | clear=0 | input0 = 0 | out=111111
Tempo=75 | clear=0 | input0 = 0 | out=111110
Tempo=80 | clear=0 | input0 = 1 | out=111110
Tempo=85 | clear=0 | input0 = 0 | out=111100
Tempo=95 | clear=0 | input0 = 0 | out=111000
Tempo=105 | clear=0 | input0 = 0 | out=110000
Tempo=115 | clear=0 | input0 = 0 | out=100000
Tempo=125 | clear=0 | input0 = 0 | out=000000
Tempo=135 | clear=0 | input0 = 0 | out=000001
Tempo=145 | clear=0 | input0 = 0 | out=000011
Tempo=155 | clear=1 | input0 = 0 | out=00000


*/

/*
    -Notas:

Para compilar: iverilog -o Guia_1403.vvp Guia_1403.v
Para executar: vvp Guia_1403.vvp
*/

