/*
    -identificação: 

ContadorDecadicoCrescente - 01 / 11 / 2024

Nome: Davi Cândido de Almeida
Matricula: 857859
Código de Pessoa: 1527368

*/

`include "Flip_Flop_JK.v"

module ContadorDecadicoCrescente (
    output Qd, Qc, Qb, Qa,   
    input pulse,                      
    input in1,                      
    input clr          
);

wire QNot_a, QNot_b, QNot_c, QNot_d, nand1, nand2;

nand nand_1(nand1, ~Qa, Qb, ~Qc, Qd);
nand nand_2(nand2, clr, nand1);

jkff Flip_Flop_JK_a(Qa, QNot_a, in1, in1, pulse, 1'b0 , nand2);
jkff Flip_Flop_JK_b(Qb, QNot_b, in1, in1, QNot_a, 1'b0 , nand2);
jkff Flip_Flop_JK_c(Qc, QNot_c, in1, in1, QNot_b, 1'b0 , nand2);
jkff Flip_Flop_JK_d(Qd, QNot_d, in1, in1, QNot_c, 1'b0 , nand2);

endmodule