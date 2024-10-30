/*
    -identificação: 

RAM_4x8 - 25 / 10 / 2024

Nome: Davi Cândido de Almeida
Matricula: 857859
Código de Pessoa: 1527368

*/
`include "RAM_2x8.v"


module RAM_4x8 (
    output out1, out2, out3, out4, out5, out6, out7, out8,   // Saida 8 bits
    input in1, in2, in3, in4, in5, in6, in7, in8,           // Entradas 8 bits
    input addr1, addr2, r_w, clk,                                  // Endereço 1 e 2, Leitura/Escrita, e Clock
    input clear                                           // Limpeza
);

wire out1_1, out2_1, out3_1, out4_1, out5_1, out6_1, out7_1, out8_1;
wire out1_2, out2_2, out3_2, out4_2, out5_2, out6_2, out7_2, out8_2;
wire y0, y1, p0, p1;

// Instancia o demultiplexador 1:2
demux1to2 demu_1(addr2, addr1, y0, y1);
demux1to2 demu_2(addr2, r_w, p0, p1);

RAM_2x8 ram_1(out1_1, out2_1, out3_1, out4_1, out5_1, out6_1, out7_1, out8_1, in1, in2, in3, in4, in5, in6, in7, in8, y0, p0, clk, clear);

RAM_2x8 ram_2(out1_2, out2_2, out3_2, out4_2, out5_2, out6_2, out7_2, out8_2, in1, in2, in3, in4, in5, in6, in7, in8, y1, p1, clk, clear);

mux2to1 mux1(addr2, out1_1, out1_2, out1);
mux2to1 mux2(addr2, out2_1, out2_2, out2);
mux2to1 mux3(addr2, out3_1, out3_2, out3);
mux2to1 mux4(addr2, out4_1, out4_2, out4);
mux2to1 mux5(addr2, out5_1, out5_2, out5);
mux2to1 mux6(addr2, out6_1, out6_2, out6);
mux2to1 mux7(addr2, out7_1, out7_2, out7);
mux2to1 mux8(addr2, out8_1, out8_2, out8);

endmodule