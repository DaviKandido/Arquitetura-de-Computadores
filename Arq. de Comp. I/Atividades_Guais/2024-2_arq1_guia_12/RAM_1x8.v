/*
    -identificação: 

RAM_1x8 - 24 / 10 / 2024

Nome: Davi Cândido de Almeida
Matricula: 857859
Código de Pessoa: 1527368

*/

`include "RAM_1x4.v"

module RAM_1x8 (
    output out1, out2, out3, out4, out5, out6, out7, out8,   // Saida 8 bits
    input in1, in2, in3, in4, in5, in6, in7, in8,           // Entradas 8 bits
    input addr, r_w, clk,                                  // Endereço, Leitura/Escrita, e Clock
    input clear                                           // Limpeza
);

wire ram1, ram2;

RAM_1x4 ram_1(out1, out2, out3, out4, in1, in2, in3, in4, addr, r_w, clk, clear);

RAM_1x4 ram_2(out5, out6, out7, out8, in5, in6, in7, in8, addr, r_w, clk, clear);

endmodule