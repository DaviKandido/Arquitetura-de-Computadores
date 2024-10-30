/*
    -identificação: 

RAM_4x8 - 25 / 10 / 2024

Nome: Davi Cândido de Almeida
Matricula: 857859
Código de Pessoa: 1527368

*/

`include "RAM_4x16.v"

module RAM_8x16 (
    output out1, out2, out3, out4, out5, out6, out7, out8,  // Saídas do primeiro bloco de RAM
    output out9, out10, out11, out12, out13, out14, out15, out16, // Saídas do segundo bloco de RAM
    input in1, in2, in3, in4, in5, in6, in7, in8,         // Entradas do primeiro bloco de RAM
    input in9, in10, in11, in12, in13, in14, in15, in16, // Entradas do segundo bloco de RAM
    input addr1, addr2, addr3, r_w, clk,                  // Endereço, Leitura/Escrita, e Clock
    input clear                                           // Limpeza
);

wire out1_1, out2_1, out3_1, out4_1, out5_1, out6_1, out7_1, out8_1, out9_1, out10_1, out11_1, out12_1, out13_1, out14_1, out15_1, out16_1;
wire out1_2, out2_2, out3_2, out4_2, out5_2, out6_2, out7_2, out8_2, out9_2, out10_2, out11_2, out12_2, out13_2, out14_2, out15_2, out16_2;
wire y0, y1, p0, p1;

// Instancia o demultiplexador 1:2
demux1to2 demu_1(addr3, addr1, y0, y1);
demux1to2 demu_2(addr3, r_w, p0, p1);

RAM_4x16 ram_1(out1_1, out2_1, out3_1, out4_1, out5_1, out6_1, out7_1, out8_1, out9_1, out10_1, out11_1, out12_1, out13_1, out14_1, out15_1, out16_1,in1, in2, in3, in4, in5, in6, in7, in8, in9, in10, in11, in12, in13, in14, in15, in16, y0, addr2, p0, clk, clear);

RAM_4x16 ram_2(out1_2, out2_2, out3_2, out4_2, out5_2, out6_2, out7_2, out8_2, in1, in2, in3, in4, in5, in6, in7, in8, y1, addr2, p1, clk, clear);

mux2to1 mux1(addr3, out1_1,   out1_2, out1);
mux2to1 mux2(addr3, out2_1,   out2_2, out2);
mux2to1 mux3(addr3, out3_1,   out3_2, out3);
mux2to1 mux4(addr3, out4_1,   out4_2, out4);
mux2to1 mux5(addr3, out5_1,   out5_2, out5);
mux2to1 mux6(addr3, out6_1,   out6_2, out6);
mux2to1 mux7(addr3, out7_1,   out7_2, out7);
mux2to1 mux8(addr3, out8_1,   out8_2, out8);
mux2to1 mux9(addr3, out9_1,   out9_2, out9);
mux2to1 mux10(addr3, out10_1, out10_2, out10);
mux2to1 mux11(addr3, out11_1, out11_2, out11);
mux2to1 mux12(addr3, out12_1, out12_2, out12);
mux2to1 mux13(addr3, out13_1, out13_2, out13);
mux2to1 mux14(addr3, out14_1, out14_2, out14);
mux2to1 mux15(addr3, out15_1, out15_2, out15);
mux2to1 mux16(addr3, out16_1, out16_2, out16);

endmodule