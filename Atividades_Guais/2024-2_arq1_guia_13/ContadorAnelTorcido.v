/*
    -identificação: 

ContadorAnelTorcido - 01 / 11 / 2024

Nome: Davi Cândido de Almeida
Matricula: 857859
Código de Pessoa: 1527368

*/

`include "Flip_Flop_JK.v"

module ContadorAnelTorcido (
    output Qa, Qb, Qc, Qd, Qe,  
    input input1, 
    input clk,                      
    input clr          
);

wire QNot_a, QNot_b, QNot_c, QNot_d, QNot_e, or1;

or or_1(or1, input1, QNot_e);

jkff Flip_Flop_JK_a(Qa, QNot_a, or1, ~or1, clk, 1'b0 , clr);
jkff Flip_Flop_JK_b(Qb, QNot_b, Qa, ~Qa, clk, 1'b0 , clr);
jkff Flip_Flop_JK_c(Qc, QNot_c, Qb, ~Qb, clk, 1'b0 , clr);
jkff Flip_Flop_JK_d(Qd, QNot_d, Qc, ~Qc, clk, 1'b0 , clr);
jkff Flip_Flop_JK_e(Qe, QNot_e, Qd, ~Qd, clk, 1'b0 , clr);


endmodule