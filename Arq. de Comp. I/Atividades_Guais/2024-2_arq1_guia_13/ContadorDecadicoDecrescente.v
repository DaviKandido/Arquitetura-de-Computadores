/*
    -identificação: 

ContadorDecadicoDecrescente - 01 / 11 / 2024

Nome: Davi Cândido de Almeida
Matricula: 857859
Código de Pessoa: 1527368

*/

`include "Flip_Flop_JK.v"

module ContadorDecadicoDecrescente (
    output Qd, Qc, Qb, Qa,   
    input pulse,                      
    input in1                      
);

wire QNot_a, QNot_b, QNot_c, QNot_d, and1, or1;

and and_1(and1, ~QNot_a, QNot_b, ~QNot_c, QNot_d);
or or_1(or1, ~in1, and1);

jkff Flip_Flop_JK_a(Qa, QNot_a, in1, in1, pulse, or1, 1'b0);
jkff Flip_Flop_JK_b(Qb, QNot_b, in1, in1, Qa, or1, 1'b0);
jkff Flip_Flop_JK_c(Qc, QNot_c, in1, in1, Qb, or1, 1'b0);
jkff Flip_Flop_JK_d(Qd, QNot_d, in1, in1, Qc, or1, 1'b0);

endmodule