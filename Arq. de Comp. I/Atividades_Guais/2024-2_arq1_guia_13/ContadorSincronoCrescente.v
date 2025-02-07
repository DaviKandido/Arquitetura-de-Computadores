/*
    -identificação: 

ContadorSincronoCrescente - 01 / 11 / 2024

Nome: Davi Cândido de Almeida
Matricula: 857859
Código de Pessoa: 1527368

*/

`include "Flip_Flop_T.v"

module ContadorSincronoCrescente (
    output Qc, Qb, Qa,   
    input pulse,    
    input clk,                   
    input clr          
);

wire QNot_a, QNot_b, QNot_c, nand1, nand2, and1;

nand nand_1(nand1, Qa, Qb, Qc);
nand nand_2(nand2, clr, nand1);

tff Flip_Flop_T_a(Qa, QNot_a, pulse, clk, 1'b0 , nand2);
tff Flip_Flop_T_b(Qb, QNot_b, Qa, clk, 1'b0 , nand2);

and(and1, Qa, Qb);

tff Flip_Flop_T_c(Qc, QNot_c, and1, clk, 1'b0 , nand2);

endmodule