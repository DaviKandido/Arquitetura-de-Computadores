/*
    -identificação: 

DeslocadorAnelTorcidoEsquerda1Bit - 08 / 11 / 2024

Nome: Davi Cândido de Almeida
Matricula: 857859
Código de Pessoa: 1527368

*/

`include "Flip_Flop_D.v"

module DeslocadorAnelTorcidoEsquerda1Bit (
    output out0, out1, out2, out3, out4, out5,
    input input0,    
    input clock,                   
    input clear          
);

wire QNot_0, QNot_1, QNot_2, QNot_3, QNot_4, QNot_5;


dff Flip_Flop_D_5(out5, QNot_5, QNot_0, clock, input0 , clear);
dff Flip_Flop_D_4(out4, QNot_4, out5, clock, 1'b0 , clear);
dff Flip_Flop_D_3(out3, QNot_3, out4, clock, 1'b0 , clear);
dff Flip_Flop_D_2(out2, QNot_2, out3, clock, 1'b0 , clear);
dff Flip_Flop_D_1(out1, QNot_1, out2, clock, 1'b0 , clear);
dff Flip_Flop_D_0(out0, QNot_0, out1, clock, 1'b0 , clear);


endmodule