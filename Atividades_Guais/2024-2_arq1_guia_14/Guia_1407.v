/*
    -identificação: 

Guia_1407 - 09 / 11 / 2024

Nome: Davi Cândido de Almeida
Matricula: 857859
Código de Pessoa: 1527368

*/

`include "DeslocadorAnelTorcidoEsquerda5Bit.v"

module Guia_1407;

// Sinais de entrada e saída para o módulo
wire out_0, out_1, out_2, out_3, out_4; 
reg clock, clear, load, input0, input1, input2, input3, input4;


// Instancia o módulo
DeslocadorAnelTorcidoEsquerda5Bit deslocador(out_0, out_1, out_2, out_3, out_4, input0, input1, input2, input3, input4, clock, clear, load);

// Geração do clock
initial begin
    clock = 0;
    forever #5 clock = ~clock;
end

// Estímulos de teste
initial begin
    $monitor("Tempo=%0t | clear=%b | load=%b | input = %b%b%b%b%b | out=%b%b%b%b%b",
             $time, clear, load, input0, input1, input2, input3, input4, out_0, out_1, out_2, out_3, out_4);

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
    #5 input4 = 1;
   

    #10
         
        input0 = 0;
        input1 = 0;
        input2 = 0;
        input3 = 0;
    #5  input4 = 0;
    #10 load = 0;
    
    #10 

    #10 
    #10 
    #10
    #10
    #10 load = 1;
    #10 input0 = 1;
    #10 input0 = 0; 

    #10  load = 0;
    #10 clear = 1;

    #10 clear = 0;


      load = 1;
       input0 = 0;
       input1 = 0;
       input2 = 0;
       input3 = 1;
    #5 input4 = 1;

    #10
         
        input0 = 0;
        input1 = 0;
        input2 = 0;
        input3 = 0;
        input4 = 0;
      
    #10 load = 0;
    
    #10 

    #10 
    #10 
    #10
    #10


    $finish;
end

endmodule

/*
    -Saídas de resultados:
    
[Running] Guia_1407.v
Tempo=0 | clear=1 | load=0 | input = 0xxxx | out=xxxxx
Tempo=5 | clear=1 | load=0 | input = 0xxxx | out=00000
Tempo=10 | clear=0 | load=1 | input = 1111x | out=00000
Tempo=15 | clear=0 | load=1 | input = 11111 | out=11111
Tempo=25 | clear=0 | load=1 | input = 00001 | out=11111
Tempo=30 | clear=0 | load=1 | input = 00000 | out=11111
Tempo=35 | clear=0 | load=1 | input = 00000 | out=11110
Tempo=40 | clear=0 | load=0 | input = 00000 | out=11110
Tempo=45 | clear=0 | load=0 | input = 00000 | out=11100
Tempo=55 | clear=0 | load=0 | input = 00000 | out=11000
Tempo=65 | clear=0 | load=0 | input = 00000 | out=10000
Tempo=75 | clear=0 | load=0 | input = 00000 | out=00000
Tempo=85 | clear=0 | load=0 | input = 00000 | out=00001
Tempo=95 | clear=0 | load=0 | input = 00000 | out=00011
Tempo=100 | clear=0 | load=1 | input = 00000 | out=00011
Tempo=105 | clear=0 | load=1 | input = 00000 | out=00111
Tempo=110 | clear=0 | load=1 | input = 10000 | out=00111
Tempo=115 | clear=0 | load=1 | input = 10000 | out=11111
Tempo=120 | clear=0 | load=1 | input = 00000 | out=11111
Tempo=125 | clear=0 | load=1 | input = 00000 | out=11110
Tempo=130 | clear=0 | load=0 | input = 00000 | out=11110
Tempo=135 | clear=0 | load=0 | input = 00000 | out=11100
Tempo=140 | clear=1 | load=0 | input = 00000 | out=11100
Tempo=145 | clear=1 | load=0 | input = 00000 | out=00000
Tempo=150 | clear=0 | load=1 | input = 00010 | out=00000
Tempo=155 | clear=0 | load=1 | input = 00011 | out=00011
Tempo=165 | clear=0 | load=1 | input = 00000 | out=00111
Tempo=175 | clear=0 | load=0 | input = 00000 | out=01111
Tempo=185 | clear=0 | load=0 | input = 00000 | out=11111
Tempo=195 | clear=0 | load=0 | input = 00000 | out=11110
Tempo=205 | clear=0 | load=0 | input = 00000 | out=11100
Tempo=215 | clear=0 | load=0 | input = 00000 | out=11000
Tempo=225 | clear=0 | load=0 | input = 00000 | out=1000

*/

/*
    -Notas:

Para compilar: iverilog -o Guia_1407.vvp Guia_1407.v
Para executar: vvp Guia_1407.vvp
*/

