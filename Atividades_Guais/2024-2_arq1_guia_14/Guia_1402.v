/*
    -identificação: 

Guia_1402 - 08 / 11 / 2024

Nome: Davi Cândido de Almeida
Matricula: 857859
Código de Pessoa: 1527368

*/

`include "DeslocadorEsquera6Bit.v"

module Guia_1402;

// Sinais de entrada e saída para o módulo
wire out_0, out_1, out_2, out_3, out_4, out_5; 
reg clock, clear, load, input0, input1, input2, input3, input4, input5;


// Instancia o módulo
DeslocadorEsquera6Bit deslocador(out_0, out_1, out_2, out_3, out_4, out_5, input0, input1, input2, input3, input4, input5, clock, clear, load);

// Geração do clock
initial begin
    clock = 0;
    forever #5 clock = ~clock;
end

// Estímulos de teste
initial begin
    $monitor("Tempo=%0t | clear=%b | load=%b | input = %b%b%b%b%b%b | out=%b%b%b%b%b%b",
             $time, clear, load, input0, input1, input2, input3, input4, input5, out_0, out_1, out_2, out_3, out_4, out_5);

    // Inicialização
    input0 = 0;
    clear = 1;
    load = 0;

    #10 clear = 0; // Desativa o clear após a limpeza

    // Teste de contador

        load = 1;
       input0 = 1;
       input1 = 1;
       input2 = 1;
       input3 = 1;
       input4 = 1;
    #5 input5 = 1;

    #10
         
        input0 = 0;
        input1 = 0;
        input2 = 0;
        input3 = 0;
        input4 = 0;
    #5  input5 = 0;
    #10 load = 0;
    
    #10 

    #10 
    #10 
    #10
    #10
    #10 load = 1;
    #10 input5 = 1;
    #10 input5 = 0; 

    #10  load = 0;
    #10 clear = 1;

    #10 clear = 0;


    $finish;
end

endmodule

/*
    -Saídas de resultados:
Tempo=0 | clear=1 | load=0 | input = 0xxxxx | out=xxxxxx
Tempo=5 | clear=1 | load=0 | input = 0xxxxx | out=000000
Tempo=10 | clear=0 | load=1 | input = 11111x | out=000000
Tempo=15 | clear=0 | load=1 | input = 111111 | out=111111
Tempo=25 | clear=0 | load=1 | input = 000001 | out=111111
Tempo=30 | clear=0 | load=1 | input = 000000 | out=111111
Tempo=35 | clear=0 | load=1 | input = 000000 | out=111110
Tempo=40 | clear=0 | load=0 | input = 000000 | out=111110
Tempo=45 | clear=0 | load=0 | input = 000000 | out=111100
Tempo=55 | clear=0 | load=0 | input = 000000 | out=111000
Tempo=65 | clear=0 | load=0 | input = 000000 | out=110000
Tempo=75 | clear=0 | load=0 | input = 000000 | out=100000
Tempo=85 | clear=0 | load=0 | input = 000000 | out=000000
Tempo=100 | clear=0 | load=1 | input = 000000 | out=000000
Tempo=110 | clear=0 | load=1 | input = 000001 | out=000000
Tempo=115 | clear=0 | load=1 | input = 000001 | out=000001
Tempo=120 | clear=0 | load=1 | input = 000000 | out=000001
Tempo=125 | clear=0 | load=1 | input = 000000 | out=000010
Tempo=130 | clear=0 | load=0 | input = 000000 | out=000010
Tempo=135 | clear=0 | load=0 | input = 000000 | out=000100
Tempo=140 | clear=1 | load=0 | input = 000000 | out=000100
Tempo=145 | clear=1 | load=0 | input = 000000 | out=000000
Tempo=150 | clear=0 | load=0 | input = 000000 | out=000000

*/

/*
    -Notas:

Para compilar: iverilog -o Guia_1402.vvp Guia_1402.v
Para executar: vvp Guia_1402.vvp
*/

