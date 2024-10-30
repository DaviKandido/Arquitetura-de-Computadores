/*
    -identificação: 

RAM_1x - 24 / 10 / 2024

Nome: Davi Cândido de Almeida
Matricula: 857859
Código de Pessoa: 1527368

*/
`include "Flip_Flop_JK.v"

module RAM_1x4 (
    output out1, out2, out3, out4,   // Saida 4 bits
    input in1, in2, in3, in4,        // Entradas 4 bits
    input addr, r_w, clk,          // Endereço, Leitura/Escrita, e Clock
    input clear                     // Limpeza
);

wire q1, qnot1, q2, qnot2, q3, qnot3, q4, qnot4;

and and_1(and1, addr, r_w, clk);

jkff Flip_Flop_JK1(q1, qnot1, in1, ~in1, and1, 1'b0 , clear);

jkff Flip_Flop_JK2(q2, qnot2, in2, ~in2, and1, 1'b0 , clear);

jkff Flip_Flop_JK3(q3, qnot3, in3, ~in3, and1, 1'b0 , clear);

jkff Flip_Flop_JK4(q4, qnot4, in4, ~in4, and1, 1'b0 , clear);

and and_21(out1, addr, ~clk, q1);

and and_22(out2, addr, ~clk, q2);

and and_23(out3, addr, ~clk, q3);

and and_24(out4, addr, ~clk, q4);

endmodule