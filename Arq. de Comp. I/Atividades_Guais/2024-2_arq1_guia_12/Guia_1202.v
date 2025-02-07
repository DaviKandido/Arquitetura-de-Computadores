/*
    -identificação: 

Guia_1202 - 26 / 10 / 2024

Nome: Davi Cândido de Almeida
Matricula: 857859
Código de Pessoa: 1527368

*/

`include "RAM_1x8.v"

module test_RAM_1x8;

// Sinais de entrada e saída para o módulo
reg in1, in2, in3, in4, in5, in6, in7, in8;
reg addr, r_w, clk, clear;
wire out1, out2, out3, out4, out5, out6, out7, out8;

// Instancia o módulo RAM_1x8
RAM_1x8 dut (out1, out2, out3, out4, out5, out6, out7, out8, 
              in1, in2, in3, in4, in5, in6, in7, in8, 
              addr, r_w, clk, clear);

// Geração do clock
initial begin
    clk = 0;
    forever #5 clk = ~clk;
end

// Estímulos de teste
initial begin
    $monitor("Tempo=%0t | addr=%b | r_w=%b | in=%b%b%b%b%b%b%b%b | clear=%b | out=%b%b%b%b%b%b%b%b",
             $time, addr, r_w, in1, in2, in3, in4, in5, in6, in7, in8, clear, 
             out1, out2, out3, out4, out5, out6, out7, out8);

    // Inicialização
    in1 = 0; in2 = 0; in3 = 0; in4 = 0;
    in5 = 0; in6 = 0; in7 = 0; in8 = 0;
    addr = 0;
    r_w = 0;
    clear = 1; // Clear ativo (limpa o flip-flop)
    #10 
    clear = 0;
    #10 

    in1 = 1; in2 = 1; in3 = 0; in4 = 0;
    in5 = 0; in6 = 0; in7 = 0; in8 = 0;
    addr = 0;
    r_w = 1;
    #10


    in1 = 1; in2 = 1; in3 = 0; in4 = 0;
    in5 = 0; in6 = 0; in7 = 0; in8 = 0;
    addr = 0;
    r_w = 1;
    #10
    
    // Teste de escrita
    addr = 1; r_w = 1; in1 = 1; in2 = 0; in3 = 1; in4 = 0; 
    in5 = 1; in6 = 0; in7 = 1; in8 = 0;
    #10;

    addr = 0; r_w = 1; // Leitura
    #10;

    // Teste de escrita com novos valores
    in1 = 0; in2 = 0; in3 = 0; in4 = 0; 
    in5 = 1; in6 = 1; in7 = 1; in8 = 1;
    addr = 1; r_w = 1; 
    #10;

    addr = 1; r_w = 1; // Leitura para verificar se valores foram escritos corretamente
    #10;

    // Teste de clear
    clear = 1;
    #10;
    clear = 0;

    addr = 1; r_w = 0;
    #10;

    $finish;
end

endmodule



/*
    -Saídas de resultados:

[Running] Guia_1202.v
Tempo=0 | addr=0 | r_w=0 | in=00000000 | clear=1 | out=00000000
Tempo=10 | addr=1 | r_w=1 | in=10101010 | clear=0 | out=00000000
Tempo=20 | addr=1 | r_w=0 | in=10101010 | clear=0 | out=10101010
Tempo=25 | addr=1 | r_w=0 | in=10101010 | clear=0 | out=00000000
Tempo=30 | addr=1 | r_w=1 | in=01010101 | clear=0 | out=10101010
Tempo=35 | addr=1 | r_w=1 | in=01010101 | clear=0 | out=00000000
Tempo=40 | addr=1 | r_w=0 | in=01010101 | clear=0 | out=01010101
Tempo=45 | addr=1 | r_w=0 | in=01010101 | clear=0 | out=00000000
Tempo=50 | addr=1 | r_w=0 | in=01010101 | clear=1 | out=00000000
Tempo=60 | addr=1 | r_w=0 | in=01010101 | clear=0 | out=00000000

*/

/*
    -Notas:

Para compilar: iverilog -o Guia_1202.vvp Guia_1202.v
Para executar: vvp Guia_1202.vvp
*/

