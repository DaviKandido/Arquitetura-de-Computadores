/*
    -identificação: 

DeslocadorAnelEsquera5Bit - 08 / 11 / 2024

Nome: Davi Cândido de Almeida
Matricula: 857859
Código de Pessoa: 1527368

*/

`include "Flip_Flop_D.v"

module DeslocadorAnelTorcidoEsquerda5Bit (
    output out0, out1, out2, out3, out4,
    input input0, input1, input2, input3, input4,
    input clock,                   
    input clear,          
    input load   
);

wire QNot_0, QNot_1, QNot_2, QNot_3, QNot_4, load_0, load_1, load_2, load_3, load_4;

and and_0(load_0, load, input0);
and and_1(load_1, load, input1);
and and_2(load_2, load, input2);
and and_3(load_3, load, input3);
and and_4(load_4, load, input4);


dff Flip_Flop_D_4(out4, QNot_4, QNot_0, clock, load_4 , clear);
dff Flip_Flop_D_3(out3, QNot_3, out4, clock, load_3 , clear);
dff Flip_Flop_D_2(out2, QNot_2, out3, clock, load_2 , clear);
dff Flip_Flop_D_1(out1, QNot_1, out2, clock, load_1 , clear);
dff Flip_Flop_D_0(out0, QNot_0, out1, clock, load_0 , clear);


endmodule