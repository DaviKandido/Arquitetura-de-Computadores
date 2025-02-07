/*
    -identificação: 

RAM_4x8 - 25 / 10 / 2024

Nome: Davi Cândido de Almeida
Matricula: 857859
Código de Pessoa: 1527368

*/

`include "RAM_4x8.v"

module RAM_4x16 (
    output out1, out2, out3, out4, out5, out6, out7, out8, out9, out10, out11, out12, out13, out14, out15, out16,   // Saida 8 bits
    input in1, in2, in3, in4, in5, in6, in7, in8, in9, in10, in11, in12, in13, in14, in15, in16,          // Entradas 8 bits
    input addr1, addr2, r_w, clk,                                  // Endereço, Leitura/Escrita, e Clock
    input clear                                           // Limpeza
);

wire ram1, ram2;

RAM_4x8 ram_1(out1, out2, out3, out4, out5, out6, out7, out8, in1, in2, in3, in4, in5, in6, in7, in8, addr1, addr2, r_w, clk, clear);

RAM_4x8 ram_2(out9, out10, out11, out12, out13, out14, out15, out16, in9, in10, in11, in12, in13, in14, in15, in16, addr1, addr2, r_w, clk, clear);

endmodule