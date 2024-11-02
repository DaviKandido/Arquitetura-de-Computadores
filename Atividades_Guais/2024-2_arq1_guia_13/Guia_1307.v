/*
    -identificação: 

Guia_1307 - 31 / 10 / 2024

Nome: Davi Cândido de Almeida
Matricula: 857859
Código de Pessoa: 1527368

*/

`include "ContadorAnelTorcido.v"

module test_ContadorAnelTorcido;

// Sinais de entrada e saída para o módulo
wire out_a, out_b, out_c, out_d, out_e; 
reg clk, clear, input1, in1;


// Instancia o módulo
ContadorAnelTorcido contador(out_a, out_b, out_c, out_d, out_e, input1, clk, clear);

// Geração do clock
initial begin
    clk = 0;
    forever #5 clk = ~clk;
end

// Estímulos de teste
initial begin
    $monitor("Tempo=%0t | clk=%b | clear=%b | input = %b | out=%b%b%b%b%b",
             $time, clk, clear, input1 ,out_a, out_b, out_c, out_d, out_e);

    // Inicialização
    in1 = 0;
    input1 = 1;
    clear = 1;

    #10 clear = 0; // Desativa o clear após a limpeza

    #5 input1 = 1;
    #5 input1 = 0;
    // Teste de contador

    #10
    #10
    #10
    #10
    #10
    #10
    #10
    #10
    #10

    #5 input1 = 1;
    #5 input1 = 0;

    #10

    #5 clear = 1; // teste de limpeza
    #5 clear = 0;

    #10
    #10

    $finish;
end

endmodule

/*
    -Saídas de resultados:
Tempo=0 | clk=0 | clear=1 | input = 1 | out=00000
Tempo=5 | clk=1 | clear=1 | input = 1 | out=00000
Tempo=10 | clk=0 | clear=0 | input = 1 | out=00000
Tempo=15 | clk=1 | clear=0 | input = 1 | out=10000
Tempo=20 | clk=0 | clear=0 | input = 0 | out=10000
Tempo=25 | clk=1 | clear=0 | input = 0 | out=11000
Tempo=30 | clk=0 | clear=0 | input = 0 | out=11000
Tempo=35 | clk=1 | clear=0 | input = 0 | out=11100
Tempo=40 | clk=0 | clear=0 | input = 0 | out=11100
Tempo=45 | clk=1 | clear=0 | input = 0 | out=11110
Tempo=50 | clk=0 | clear=0 | input = 0 | out=11110
Tempo=55 | clk=1 | clear=0 | input = 0 | out=11111
Tempo=60 | clk=0 | clear=0 | input = 0 | out=11111
Tempo=65 | clk=1 | clear=0 | input = 0 | out=01111
Tempo=70 | clk=0 | clear=0 | input = 0 | out=01111
Tempo=75 | clk=1 | clear=0 | input = 0 | out=00111
Tempo=80 | clk=0 | clear=0 | input = 0 | out=00111
Tempo=85 | clk=1 | clear=0 | input = 0 | out=00011
Tempo=90 | clk=0 | clear=0 | input = 0 | out=00011
Tempo=95 | clk=1 | clear=0 | input = 0 | out=00001
Tempo=100 | clk=0 | clear=0 | input = 0 | out=00001
Tempo=105 | clk=1 | clear=0 | input = 0 | out=00000
Tempo=110 | clk=0 | clear=0 | input = 0 | out=00000
Tempo=115 | clk=1 | clear=0 | input = 1 | out=10000 //novo input
Tempo=120 | clk=0 | clear=0 | input = 0 | out=10000
Tempo=125 | clk=1 | clear=0 | input = 0 | out=11000
Tempo=130 | clk=0 | clear=0 | input = 0 | out=11000
Tempo=135 | clk=1 | clear=1 | input = 0 | out=00000 // teste de limpeza
Tempo=140 | clk=0 | clear=0 | input = 0 | out=00000
Tempo=145 | clk=1 | clear=0 | input = 0 | out=10000
Tempo=150 | clk=0 | clear=0 | input = 0 | out=10000
Tempo=155 | clk=1 | clear=0 | input = 0 | out=11000
Tempo=160 | clk=0 | clear=0 | input = 0 | out=11000

*/

/*
    -Notas:

Para compilar: iverilog -o Guia_1301.vvp Guia_1301.v
Para executar: vvp Guia_1301.vvp
*/

