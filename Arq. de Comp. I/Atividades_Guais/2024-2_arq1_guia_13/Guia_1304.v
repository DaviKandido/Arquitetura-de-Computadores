/*
    -identificação: 

Guia_1304 - 31 / 10 / 2024

Nome: Davi Cândido de Almeida
Matricula: 857859
Código de Pessoa: 1527368

*/

`include "ContadorDecadicoDecrescente.v"

module teste_ContadorDecadicoDecrescente;

// Sinais de entrada e saída para o módulo
wire out_a, out_b, out_c, out_d; 
reg clk, clear, pulse, in1;


// Instancia o módulo
ContadorDecadicoDecrescente contador(out_a, out_b, out_c, out_d, pulse, in1);

// Geração do clock
initial begin
    clk = 0;
    forever #5 clk = ~clk;
end

// Estímulos de teste
initial begin
    $monitor("Tempo=%0t | in1=%b | pulse = %b | out=%b%b%b%b",
             $time, in1, pulse, out_a, out_b, out_c, out_d);

    // Inicialização
    in1 = 0;
    pulse = 0;


    // Teste de contador
    in1 = 0;
    #5 pulse = 1;
    #5 pulse = 0;
    #5 pulse = 1;
    #5 pulse = 0;

    #5 pulse = 1;
    #5 pulse = 0;


    #5 in1 = 1;

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



    $finish;
end

endmodule

/*
    -Saídas de resultados:
Tempo=0 | in1=0 | pulse = 0 | out=1111
Tempo=5 | in1=0 | pulse = 1 | out=1111
Tempo=10 | in1=0 | pulse = 0 | out=1111
Tempo=15 | in1=0 | pulse = 1 | out=1111
Tempo=20 | in1=0 | pulse = 0 | out=1111
Tempo=25 | in1=0 | pulse = 1 | out=1111
Tempo=30 | in1=0 | pulse = 0 | out=1111
Tempo=35 | in1=1 | pulse = 0 | out=1111
Tempo=40 | in1=1 | pulse = 1 | out=1110
Tempo=45 | in1=1 | pulse = 0 | out=1110
Tempo=50 | in1=0 | pulse = 0 | out=1111 //teste de in = 0
Tempo=55 | in1=0 | pulse = 1 | out=1111
Tempo=60 | in1=0 | pulse = 0 | out=1111
Tempo=65 | in1=1 | pulse = 0 | out=1111 //retomada do contador
Tempo=70 | in1=1 | pulse = 1 | out=1110
Tempo=75 | in1=1 | pulse = 0 | out=1110
Tempo=80 | in1=1 | pulse = 1 | out=1101
Tempo=85 | in1=1 | pulse = 0 | out=1101
Tempo=90 | in1=1 | pulse = 1 | out=1100
Tempo=95 | in1=1 | pulse = 0 | out=1100
Tempo=100 | in1=1 | pulse = 1 | out=1011
Tempo=105 | in1=1 | pulse = 0 | out=1011
Tempo=110 | in1=1 | pulse = 1 | out=1010
Tempo=115 | in1=1 | pulse = 0 | out=1010
Tempo=120 | in1=1 | pulse = 1 | out=1001
Tempo=125 | in1=1 | pulse = 0 | out=1001
Tempo=130 | in1=1 | pulse = 1 | out=1000
Tempo=135 | in1=1 | pulse = 0 | out=1000
Tempo=140 | in1=1 | pulse = 1 | out=0111
Tempo=145 | in1=1 | pulse = 0 | out=0111
Tempo=150 | in1=1 | pulse = 1 | out=0110
Tempo=155 | in1=1 | pulse = 0 | out=0110

*/

/*
    -Notas:

Para compilar: iverilog -o Guia_1301.vvp Guia_1301.v
Para executar: vvp Guia_1301.vvp
*/

