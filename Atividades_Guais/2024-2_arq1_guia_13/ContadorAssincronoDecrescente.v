/*
    -identificação: 

ContadorAssincronoDecrescente - 01 / 11 / 2024

Nome: Davi Cândido de Almeida
Matricula: 857859
Código de Pessoa: 1527368

*/

`include "Flip_Flop_JK.v"

module ContadorAssincronoDecrescente (
    output QNot_a, QNot_b, QNot_c, QNot_d, QNot_e,   
    input pulse,                      
    input in1,                      
    input clr          
);

wire Qa, Qb, Qc, Qd, Qe;

jkff Flip_Flop_JK_e(Qe, QNot_e, in1, in1, pulse, 1'b0 , clr);
jkff Flip_Flop_JK_d(Qd, QNot_d, in1, in1, QNot_e, 1'b0 , clr);
jkff Flip_Flop_JK_c(Qc, QNot_c, in1, in1, QNot_d, 1'b0 , clr);
jkff Flip_Flop_JK_b(Qb, QNot_b, in1, in1, QNot_c, 1'b0 , clr);
jkff Flip_Flop_JK_a(Qa, QNot_a, in1, in1, QNot_b, 1'b0 , clr);


endmodule