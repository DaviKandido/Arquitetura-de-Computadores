/*
    -identificação: 

Guia_1302 - 31 / 10 / 2024

Nome: Davi Cândido de Almeida
Matricula: 857859
Código de Pessoa: 1527368

*/

`include "ContadorAssincronoCrescente.v"

module test_ContadorAssincronoCrescente;

// Sinais de entrada e saída para o módulo
wire out_a, out_b, out_c, out_d, out_e; 
reg clk, clear, pulse, in1;


// Instancia o módulo
ContadorAssincronoCrescente contador(out_a, out_b, out_c, out_d, out_e, pulse, in1, clear);

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

    #5 clear = 1; //Teste de limpeza

    #5 pulse = 1;
    #5 pulse = 0;




    $finish;
end

endmodule

/*
    -Saídas de resultados:
Tempo=0 | in1=0 | clear=1 | pulse = 0 | out=11111
Tempo=10 | in1=1 | clear=0 | pulse = 0 | out=11111
Tempo=15 | in1=1 | clear=0 | pulse = 1 | out=00000
Tempo=20 | in1=1 | clear=0 | pulse = 0 | out=00000
Tempo=25 | in1=1 | clear=0 | pulse = 1 | out=00001
Tempo=30 | in1=1 | clear=0 | pulse = 0 | out=00001
Tempo=35 | in1=1 | clear=0 | pulse = 1 | out=00010
Tempo=40 | in1=1 | clear=0 | pulse = 0 | out=00010
Tempo=45 | in1=0 | clear=0 | pulse = 0 | out=00010
Tempo=50 | in1=0 | clear=0 | pulse = 1 | out=00010
Tempo=55 | in1=0 | clear=0 | pulse = 0 | out=00010
Tempo=65 | in1=0 | clear=0 | pulse = 1 | out=00010
Tempo=70 | in1=0 | clear=0 | pulse = 0 | out=00010
Tempo=75 | in1=0 | clear=0 | pulse = 1 | out=00010
Tempo=80 | in1=0 | clear=0 | pulse = 0 | out=00010
Tempo=85 | in1=1 | clear=0 | pulse = 0 | out=00010
Tempo=90 | in1=1 | clear=0 | pulse = 1 | out=00011
Tempo=95 | in1=1 | clear=0 | pulse = 0 | out=00011
Tempo=100 | in1=1 | clear=0 | pulse = 1 | out=00100
Tempo=105 | in1=1 | clear=0 | pulse = 0 | out=00100
Tempo=110 | in1=1 | clear=0 | pulse = 1 | out=00101
Tempo=115 | in1=1 | clear=0 | pulse = 0 | out=00101
Tempo=120 | in1=1 | clear=0 | pulse = 1 | out=00110
Tempo=125 | in1=1 | clear=0 | pulse = 0 | out=00110
Tempo=130 | in1=1 | clear=0 | pulse = 1 | out=00111
Tempo=135 | in1=1 | clear=0 | pulse = 0 | out=00111
Tempo=140 | in1=1 | clear=0 | pulse = 1 | out=01000
Tempo=145 | in1=1 | clear=0 | pulse = 0 | out=01000
Tempo=150 | in1=1 | clear=0 | pulse = 1 | out=01001
Tempo=155 | in1=1 | clear=0 | pulse = 0 | out=01001
Tempo=160 | in1=1 | clear=1 | pulse = 0 | out=11111
Tempo=165 | in1=1 | clear=1 | pulse = 1 | out=11111
Tempo=170 | in1=1 | clear=1 | pulse = 0 | out=11111

*/

/*
    -Notas:

Para compilar: iverilog -o Guia_1301.vvp Guia_1301.v
Para executar: vvp Guia_1301.vvp
*/

