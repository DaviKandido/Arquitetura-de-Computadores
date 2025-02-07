/*
    -identificação: 

Guia_1206 - 26 / 10 / 2024

Nome: Davi Cândido de Almeida
Matricula: 857859
Código de Pessoa: 1527368
*/

`include "RAM_4x16.v"

module test_RAM_4x16;

reg in1, in2, in3, in4, in5, in6, in7, in8;
reg in9, in10, in11, in12, in13, in14, in15, in16;
reg addr1, addr2, r_w, clk, clear;
wire out1, out2, out3, out4, out5, out6, out7, out8;
wire out9, out10, out11, out12, out13, out14, out15, out16;

RAM_4x16 dut (
    out1, out2, out3, out4, 
    out5, out6, out7, out8, out9, out10, 
    out11, out12, out13, out14, out15, out16, 
    in1, in2, in3, in4, 
    in5, in6, in7, in8, 
    in9, in10, in11, in12, 
    in13, in14, in15, in16, 
    addr1, addr2, r_w, clk, clear
);

initial begin
    clk = 0;
    forever #5 clk = ~clk;
end

initial begin
    $monitor("Tempo=%0t | addr=%b%b | r_w=%b | in=%b%b%b%b%b%b%b%b%b%b%b%b%b%b%b%b | clear=%b | out=%b%b%b%b%b%b%b%b%b%b%b%b%b%b%b%b",
             $time, addr2, addr1, r_w, 
             in1, in2, in3, in4, in5, in6, in7, in8, 
             in9, in10, in11, in12, in13, in14, in15, in16, 
             clear,
             out1, out2, out3, out4, 
             out5, out6, out7, out8, 
             out9, out10, out11, out12, 
             out13, out14, out15, out16);

    in1 = 0; in2 = 0; in3 = 0; in4 = 0;
    in5 = 0; in6 = 0; in7 = 0; in8 = 0;
    in9 = 0; in10 = 0; in11 = 0; in12 = 0;
    in13 = 0; in14 = 0; in15 = 0; in16 = 0;
    addr1 = 0; addr2 = 0;
    r_w = 0;
    clear = 1;
    #10 clear = 0;
    #10;

    r_w = 1;
    addr1 = 0; addr2 = 0; 
    in1 = 1; in2 = 0; in3 = 1; in4 = 0;
    in5 = 1; in6 = 0; in7 = 1; in8 = 0;
    in9 = 1; in10 = 0; in11 = 1; in12 = 0;
    in13 = 1; in14 = 0; in15 = 1; in16 = 0;
    #10;

    addr1 = 1; addr2 = 0; 
    in1 = 0; in2 = 1; in3 = 0; in4 = 1;
    in5 = 0; in6 = 1; in7 = 0; in8 = 1;
    in9 = 0; in10 = 1; in11 = 0; in12 = 1;
    in13 = 0; in14 = 1; in15 = 0; in16 = 1;
    #10;

    r_w = 0; 
    addr1 = 0; addr2 = 0; #10; 
    addr1 = 1; addr2 = 0; #10;

    addr1 = 0; addr2 = 1; r_w = 1; 
    in1 = 1; in2 = 1; in3 = 1; in4 = 1;
    in5 = 1; in6 = 1; in7 = 1; in8 = 1;
    in9 = 1; in10 = 1; in11 = 1; in12 = 1;
    in13 = 1; in14 = 1; in15 = 1; in16 = 1; 
    #10;

    r_w = 0; 
    addr1 = 0; addr2 = 1; #10;

    clear = 1; 
    #10;
    clear = 0;

    addr1 = 0; addr2 = 0; r_w = 0; 
    #10;

    $finish;
end

endmodule


/*
    -Saídas de resultados:


Tempo=0 | addr=00 | r_w=0 | in=0000000000000000 | clear=1 | out=0000000000000000
Tempo=10 | addr=00 | r_w=0 | in=0000000000000000 | clear=0 | out=0000000000000000
Tempo=20 | addr=00 | r_w=1 | in=1010101010101010 | clear=0 | out=0000000000000000
Tempo=30 | addr=01 | r_w=1 | in=0101010101010101 | clear=0 | out=0000000000000000
Tempo=40 | addr=00 | r_w=0 | in=0101010101010101 | clear=0 | out=1010101010101010
Tempo=45 | addr=00 | r_w=0 | in=0101010101010101 | clear=0 | out=0000000000000000
Tempo=50 | addr=01 | r_w=0 | in=0101010101010101 | clear=0 | out=0101010101010101
Tempo=55 | addr=01 | r_w=0 | in=0101010101010101 | clear=0 | out=0000000000000000
Tempo=60 | addr=10 | r_w=1 | in=1111111111111111 | clear=0 | out=0000000000000000
Tempo=70 | addr=10 | r_w=0 | in=1111111111111111 | clear=0 | out=1111111111111111
Tempo=75 | addr=10 | r_w=0 | in=1111111111111111 | clear=0 | out=0000000000000000
Tempo=80 | addr=10 | r_w=0 | in=1111111111111111 | clear=1 | out=0000000000000000
Tempo=90 | addr=00 | r_w=0 | in=1111111111111111 | clear=0 | out=0000000000000000

*/

/*
    -Notas:

Para compilar: iverilog -o Guia_1206.vvp Guia_1206.v
Para executar: vvp Guia_1206.vvp
*/