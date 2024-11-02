/*
    -identificação: 

Guia_1303 - 31 / 10 / 2024

Nome: Davi Cândido de Almeida
Matricula: 857859
Código de Pessoa: 1527368

*/

`include "ContadorDecadicoCrescente.v"

module test_ContadorDecadicoCrescente;

// Sinais de entrada e saída para o módulo
wire out_a, out_b, out_c, out_d; 
reg clk, clear, pulse, in1;


// Instancia o módulo
ContadorDecadicoCrescente contador(out_a, out_b, out_c, out_d, pulse, in1, clear);

// Geração do clock
initial begin
    clk = 0;
    forever #5 clk = ~clk;
end

// Estímulos de teste
initial begin
    $monitor("Tempo=%0t | in1=%b | clear=%b | pulse = %b | out=%b%b%b%b",
             $time, in1, clear, pulse,out_a, out_b, out_c, out_d);

    // Inicialização
    in1 = 0;
    pulse = 0;
    clear = 1;

    #10 clear = 0; // Desativa o clear após a limpeza

    // Teste de contador


    #10 clear = 1; // ativa o clear após a limpeza

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


    #5 pulse = 1;
    #5 pulse = 0;

    #5 clear = 0; //Teste de limpeza



    $finish;
end

endmodule

/*
    -Saídas de resultados:
Tempo=0 | in1=0 | clear=1 | pulse = 0 | out=xxxx
Tempo=10 | in1=0 | clear=0 | pulse = 0 | out=0000
Tempo=20 | in1=1 | clear=1 | pulse = 0 | out=0000
Tempo=25 | in1=1 | clear=1 | pulse = 1 | out=0001
Tempo=30 | in1=1 | clear=1 | pulse = 0 | out=0001
Tempo=35 | in1=1 | clear=1 | pulse = 1 | out=0010
Tempo=40 | in1=1 | clear=1 | pulse = 0 | out=0010
Tempo=45 | in1=1 | clear=1 | pulse = 1 | out=0011
Tempo=50 | in1=1 | clear=1 | pulse = 0 | out=0011
Tempo=55 | in1=0 | clear=1 | pulse = 0 | out=0011
Tempo=60 | in1=0 | clear=1 | pulse = 1 | out=0011
Tempo=65 | in1=0 | clear=1 | pulse = 0 | out=0011
Tempo=75 | in1=0 | clear=1 | pulse = 1 | out=0011
Tempo=80 | in1=0 | clear=1 | pulse = 0 | out=0011
Tempo=85 | in1=0 | clear=1 | pulse = 1 | out=0011
Tempo=90 | in1=0 | clear=1 | pulse = 0 | out=0011
Tempo=95 | in1=1 | clear=1 | pulse = 0 | out=0011
Tempo=100 | in1=1 | clear=1 | pulse = 1 | out=0100
Tempo=105 | in1=1 | clear=1 | pulse = 0 | out=0100
Tempo=110 | in1=1 | clear=1 | pulse = 1 | out=0101
Tempo=115 | in1=1 | clear=1 | pulse = 0 | out=0101
Tempo=120 | in1=1 | clear=1 | pulse = 1 | out=0110
Tempo=125 | in1=1 | clear=1 | pulse = 0 | out=0110
Tempo=130 | in1=1 | clear=1 | pulse = 1 | out=0111
Tempo=135 | in1=1 | clear=1 | pulse = 0 | out=0111
Tempo=140 | in1=1 | clear=1 | pulse = 1 | out=1000
Tempo=145 | in1=1 | clear=1 | pulse = 0 | out=1000
Tempo=150 | in1=1 | clear=1 | pulse = 1 | out=1001
Tempo=155 | in1=1 | clear=1 | pulse = 0 | out=1001 //Contou até 10
Tempo=160 | in1=1 | clear=1 | pulse = 1 | out=0000
Tempo=165 | in1=1 | clear=1 | pulse = 0 | out=0000
Tempo=170 | in1=1 | clear=1 | pulse = 1 | out=0001
Tempo=175 | in1=1 | clear=1 | pulse = 0 | out=0001
Tempo=180 | in1=1 | clear=0 | pulse = 0 | out=0000 //Clear ativado

*/

/*
    -Notas:

Para compilar: iverilog -o Guia_1301.vvp Guia_1301.v
Para executar: vvp Guia_1301.vvp
*/

