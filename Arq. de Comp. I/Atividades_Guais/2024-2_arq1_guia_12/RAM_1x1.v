/*
    -identificação: 

RAM_1x1 - 24 / 10 / 2024

Nome: Davi Cândido de Almeida
Matricula: 857859
Código de Pessoa: 1527368

*/
`include "Flip_Flop_JK.v"

module RAM_1x1 (
    output out1,                      // Saida 4 bits
    input in1,                       // Entradas 4 bits
    input addr, r_w, clk,           // Endereço, Leitura/Escrita, e Clock
    input clear                    // Limpeza
);

wire q1, qnot1, and1;

and and_1(and1, addr, r_w, clk);

jkff Flip_Flop_JK(q1, qnot1, in1, ~in1, and1, 1'b0 , clear);

and and_2(out1, addr, q1);

endmodule